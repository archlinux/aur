# Maintainer: hertg <aur@her.tg>
_pkgname=egpu-switcher
pkgname=$_pkgname-git
pkgver=0.17.0.r2.ge9b9479
pkgrel=1
epoch=0
pkgdesc="Distribution agnostic script that works with NVIDIA and AMD cards."
arch=('any')
url="https://github.com/hertg/egpu-switcher"
license=('GPL')
depends=('pciutils>=3.3.0' 'bash>=4.0')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/hertg/egpu-switcher.git#branch=legacy")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}

