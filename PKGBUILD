# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="hyprevents"
pkgname="$_pkgname-git"
pkgver=4.9b5e895
pkgrel=1
pkgdesc="Invoke shell functions in response to Hyprland socket2 events."
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
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
    make PREFIX="$pkgdir/" install
}
