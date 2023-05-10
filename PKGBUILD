# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Jelle  van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=5.2.1
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPL')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('7a5da9ece78189c502367c2d087054a9f494ad5b872d58275eeaa26bc8be9743b67927570fe990ace2a16f7e956679049ab687254e8ce355c42d1a06f93cfcaa')

package(){
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/cura"
  
  # see https://github.com/Ultimaker/cura-binary-data/issues/6
  rm -rf "${pkgdir}/usr/share/cura/resources/i18n" 
}
