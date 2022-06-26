# Maintainer: Reese Wang <thuwrx10 at gmail dot com>

pkgname='elxocmcorekit'
pkgver=14.0.505.14
pkgrel=1
pkgdesc="CLI manager of Emulex HBAs in physical and virtual server deployments"
arch=('x86_64')
url="https://www.broadcom.com/products/storage/fibre-channel-host-bus-adapters/emulex-hba-manager"
license=('custom')
options=('!strip')
source=("file://elxocmcore-ubuntu18-22-${pkgver}-${pkgrel}.tgz")
sha256sums=('9630d6c77736db7430e43aca52db73709c70301008a01e23b4e6fdfd6b04ec3f')

prepare() {
	ar x elxocmcore-ubuntu18-22-${pkgver}-${pkgrel}/x86_64/ubuntu-20/elxocmcorekit_${pkgver}-${pkgrel}_amd64.deb
}

package() {
	tar xf data.tar.xz -C "$pkgdir"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${pkgdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/lib" "${pkgdir}/usr/"
}
