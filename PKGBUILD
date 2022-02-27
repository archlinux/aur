# Maintainer: Ben Mezger <me at benmezger dot nl>
_pkgname=gitmux
pkgname=$_pkgname-git
pkgver=r45.cd50b54
pkgrel=1
pkgdesc="Git in your tmux status bar"
arch=('any')
url="https://github.com/arl/gitmux"
license=('MIT')
makedepends=('git' 'go')
optdepends=('tmux')
source=('git+https://github.com/arl/gitmux.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname}"
        go build
        install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
