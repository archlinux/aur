# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Robert Booster <boosterdev@linuxmail.org>
# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>
# Contributor: Kamil Śliwak <cameel2 gmail>

pkgname=meteor-js
pkgver=1.4.4.3
pkgrel=2
pkgdesc="Full-stack JavaScript platform for developing modern web and mobile applications"
arch=('i686' 'x86_64')
url="https://www.meteor.com"
license=('MIT')
depends=('nodejs' 'mongodb')
options=('!strip')
source=(meteor.sh)
source_i686=("meteor-bootstrap-os.linux.$pkgver.i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("meteor-bootstrap-os.linux.$pkgver.x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")
sha256sums=('698655075e31e455d7a62241c0dddd7f779f247399dc5452edcf24e3d45bd1cd')
sha256sums_i686=('d091733f373cf08dfcb64c8935a9ab1fa81847e0b6afb36c6a02aa96a6efdb84')
sha256sums_x86_64=('ee6bb520f1cb0de7ca7404066a4d4a746724529345b5d7e77c34179e98cd3309')

package() {
  install -d "${pkgdir}/usr/share"
  cp -R "${srcdir}/.meteor" "${pkgdir}/usr/share/meteor"
  install -Dm 0755 "${srcdir}/meteor.sh" "${pkgdir}/usr/bin/meteor"
}
