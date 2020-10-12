# Maintainer: Nelson Santos <nbsantos@gmail.com>
_pkgname=egpu-switcher
pkgname=$_pkgname-git
pkgver=0.16.0.r0.gd22ce2e
pkgrel=1
pkgdesc="Distribution agnostic script that works with NVIDIA and AMD cards."
arch=('any')
url="https://github.com/hertg/egpu-switcher"
license=('GPL')
depends=('pciutils>=3.3.0' 'bash>=4.0')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/hertg/egpu-switcher.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}

