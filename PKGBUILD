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
pkgver=1.5.1
pkgrel=1
pkgdesc="Full-stack JavaScript platform for developing modern web and mobile applications"
arch=('i686' 'x86_64')
url="https://www.meteor.com"
license=('MIT')
depends=('nodejs' 'mongodb')
options=('!strip')
install=meteor.install
source_i686=("meteor-bootstrap-os.linux.$pkgver.i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("meteor-bootstrap-os.linux.$pkgver.x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")
source=(meteor.sh
        meteor.install)
sha256sums_i686=('c7dee70e7d94f2948e2cc7edbf53017a77c0ac530bd3780d041d073e1c957a0a')
sha256sums_x86_64=('b64d3635a1c49e30b8aacbcae6114d3b9ffc8362cb02a679655bbfcab232356d')
sha256sums=('698655075e31e455d7a62241c0dddd7f779f247399dc5452edcf24e3d45bd1cd'
            '1b771dbb171dde3bea055d3e38f773a8d8b2dcf66c2f0256ceb01de3a0f9184c')

package() {
  install -d "$pkgdir/usr/share/"
  cp -R "$srcdir/.meteor/" "$pkgdir/usr/share/meteor/"
  install -Dm 0755 "$srcdir/meteor.sh" "$pkgdir/usr/bin/meteor"
}
