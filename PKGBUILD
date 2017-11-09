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
pkgver=1.6
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
sha512sums_i686=('8d627c585d26e2f2e69a997a10e4b9c60af0678db017311a1ef0ca8c87b17c471128305f25ef3f4e2debf6c831507990d580d873f54fec81e4b98420fb181d21')
sha512sums_x86_64=('94c946d247a457c0f3178c74506a863bf9993ecbc66134221eeebbf471405331b3902edbd9d45f19e697ab813983f278bd2650aa9772a65e6c1af5887fd21ba6')
sha512sums=('56b0dde5e1ed777b3a97540d96bf087828b84164063df8780d17780b470cf892793bd77485bf1036d5c9b9ed647c7bef554b625316938a1cbf1389fc71ad3d61'
            '54ccc626d24f5f00502f4f0b38087f2979ae8a7907e5fd41ae8fb708052815a9bc381c9e525f9f41ee5fa9f34b9429e6c4d6f36030387e58b60d38488cf03eaa')

package() {
  install -d "$pkgdir"/usr/share/
  cp -R "$srcdir"/.meteor/ "$pkgdir"/usr/share/meteor/
  install -Dm 0755 "$srcdir"/meteor.sh "$pkgdir"/usr/bin/meteor
}
