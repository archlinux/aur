# Maintainer: Sateallia <mail at sateallia dot org>

pkgname=cso-thumbnailer
pkgver=1.0.0
pkgrel=3
pkgdesc='A thumbnailer for "application/x-compressed-iso" MIME type PSP software files'
arch=('x86_64')
url='https://coding.homdworks.org/sateallia/cso-thumbnailer'
license=('MIT')

source=("${pkgname}-${pkgver}.tar.gz::https://coding.homdworks.org/sateallia/cso-thumbnailer/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}"
	make
}

package() {
    cd "${pkgname}"
    install -D -m644 cso.thumbnailer "${pkgdir}/usr/share/thumbnailers/cso.thumbnailer"
    install -D -m755 cso-thumbnailer "${pkgdir}/usr/bin/cso-thumbnailer"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('00ac96d87c4ae831f54ff6d5ccb554620200895013b365f296c92938e12c0d39')
