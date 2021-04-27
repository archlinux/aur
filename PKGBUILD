# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: tuberry <youremail@domain.com>

pkgname=gnome-shell-extension-user-theme-x-git
_pkgname=user-theme-x
pkgver=3.38.r2.g4fb2622
pkgrel=1
pkgdesc="Customizable gnome shell user-theme with user stylesheet and night theme autoswitch support"
arch=('any')
url="https://github.com/tuberry/user-theme-x"
license=('LGPL3')
depends=('gnome-shell>=3.36')
makedepends=('git' 'make')
source=("$_pkgname::git+https://github.com/tuberry/user-theme-x.git")
sha256sums=('SKIP')

pkgver() {
  	cd "$srcdir/$_pkgname"
  	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}