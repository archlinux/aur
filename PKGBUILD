# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.5.3
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=('any')
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=('python' 'perl-image-exiftool')
provides=('phockup')
conflicts=('phockup' 'phockup-git')
source=("https://github.com/ivandokov/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b082cc04cdc3b57aa1e6d59ca6ce5d6c')

package() {

  install -d ${pkgdir}/usr/share/${pkgname}
  cp ${srcdir}/${pkgname}-${pkgver}/phockup.py ${pkgdir}/usr/share/${pkgname}/phockup.py

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/phockup.py ${pkgdir}/usr/bin/phockup

  install -D ${srcdir}/${pkgname}-${pkgver}/license ${pkgdir}/usr/share/licenses/${pkgname}/MIT
}

