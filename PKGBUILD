# Contributor: hwesselmann <hauke@h-dawg.de>
# Contributor: Amish <contact at via dot aur>
# Contributor: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark
pkgver=3.0.2
pkgrel=1
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('any')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
depends=('java-runtime' 'unixodbc' 'libxtst')
options=('!strip')
source=(http://download.igniterealtime.org/${pkgname}/${pkgname}_${pkgver//./_}.deb)
sha512sums=('773a5e2b7d9f4cf5c4c35ae8e387b7edffa681253dbf2a6787bd1ec6c9bdef1fd6832aa85199ac33f54a4e42afa68fd649995f1f1a86e3b872f24c9ddcb925b4')
conflicts=('spark-svn')

package() {
    msg2 "Extracting the data.tar.gz..."
    bsdtar -C "${pkgdir}" -xf data.tar.gz
    chmod +x "${pkgdir}"/opt/Spark/bin/startup.sh
}
