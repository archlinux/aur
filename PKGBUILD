# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=mmdvmcal-git
pkgver=r129.76a13a8
pkgrel=1
pkgdesc="The calibration program for the MMDVM"
arch=('x86_64' 'i686')
url="https://github.com/g4klx/MMDVMCal"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mmdvmcal::git+https://github.com/g4klx/MMDVMCal.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 MMDVMCal "${pkgdir}/usr/bin/MMDVMCal"
}
