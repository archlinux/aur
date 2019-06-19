# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.5.8
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=(any)
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=(python perl-image-exiftool)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ivandokov/phockup/archive/${pkgver}.tar.gz")
sha256sums=('1c43cd5f33d55ffc46f8e5cde371e6d6e6cc691740b47c4f65485630e22233d6')

package() {

  install -d ${pkgdir}/usr/share/${pkgname}
  cp ${srcdir}/${pkgname}-${pkgver}/phockup.py ${pkgdir}/usr/share/${pkgname}/phockup.py

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/phockup.py ${pkgdir}/usr/bin/phockup

  install -D ${srcdir}/${pkgname}-${pkgver}/license ${pkgdir}/usr/share/licenses/${pkgname}/MIT
}

