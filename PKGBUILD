# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=semt
pkgver=1.1
pkgrel=1
pkgdesc="Processing the \"Extended display identification data\" (EDID) in order to apply a custom resolution. This is helpfull if the concerning monitor does not provide an EDID itself or its EDID is corrupted."
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/semt"
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Edenhofer/semt/archive/v${pkgver}.tar.gz")
md5sums=('e9d1ab41f5122a2bcbf79937cbcfad0c')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
