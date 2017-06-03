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
pkgver=1.5
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
sha256sums_i686=('578cbea10ccd95759f6ba77e23e86c6a5b48cf3ed1fa95a1c3161156ae61345d')
sha256sums_x86_64=('774426297b3e2dc30a96ad85903920c6ce9e7527e3bbfac93b510688d0c69c33')
sha256sums=('698655075e31e455d7a62241c0dddd7f779f247399dc5452edcf24e3d45bd1cd'
            'dbf977d650bc28c97f54687f5a0da5d397c3035d92e0d270e829adbedf959c66')

package() {
  install -d "$pkgdir/usr/share/"
  cp -R "$srcdir/.meteor/" "$pkgdir/usr/share/meteor/"
  install -Dm 0755 "$srcdir/meteor.sh" "$pkgdir/usr/bin/meteor"
}
