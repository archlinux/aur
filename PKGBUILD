# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="hyprcwd"
pkgname="$_pkgname-git"
pkgver=9.05193f4
pkgrel=1
pkgdesc="xcwd for Hyprland"
arch=('any')
url="https://github.com/vilari-mickopf/$_pkgname"
depends=('hyprland' 'jq' 'procps-ng' 'awk' 'coreutils' 'bash')
makedepends=('git')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
