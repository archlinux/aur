# Maintainer: Ben Mezger <me at benmezger dot nl>
_pkgname=gitmux
pkgname=$_pkgname-git
pkgver=r70.5479145
pkgrel=1
pkgdesc="Git in your tmux status bar"
arch=('x86_64')
url="https://github.com/arl/gitmux"
license=('MIT')
makedepends=('git' 'go')
depends=('tmux')
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
