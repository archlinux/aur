# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: tuberry <youremail@domain.com>

pkgname=gnome-shell-extension-shuzhi-git
_pkgname=shuzhi
pkgver=3.38.r15.ge0a5a95
pkgrel=1
pkgdesc="A wallpaper generation extension for gnome shell, inspired by Jizhi"
arch=('any')
url="https://github.com/tuberry/shuzhi"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('git' 'make')
checkdepends=('fortune-mod')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
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
