# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="hyprcwd"
pkgname="$_pkgname-git"
pkgver=1.d076b59
pkgrel=1
pkgdesc="xcwd for Hyprland"
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
depends=('jq')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    make PREFIX="$pkgdir/usr" install
}
