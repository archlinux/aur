# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=semt
pkgver=1.1.1
pkgrel=1
pkgdesc="Processing the \"Extended display identification data\" (EDID) in order to apply a custom resolution. This is helpfull if the concerning monitor does not provide an EDID itself or its EDID is corrupted."
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/semt"
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Edenhofer/semt/archive/v${pkgver}.tar.gz")
sha512sums=('5556d4f92cb7ce00dc85c4b3c082e4458776deefaaf89de3a8ae755e8b1fc17081608f4acc198dce2fe2d249b1f87848e4fff92f630228ecc1d0d7ff4f7275a9')

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
	make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
