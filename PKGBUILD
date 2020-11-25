# Maintainer: hwesselmann <hauke@h-dawg.de>
# Contributor: Amish <contact at via dot aur>
# Contributor: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark
pkgver=2.9.4
pkgrel=1
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('any')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
depends=('java-runtime' 'unixodbc' 'libxtst')
options=('!strip')
source=(http://download.igniterealtime.org/${pkgname}/${pkgname}_${pkgver//./_}.deb)
sha512sums=('5da94356a0c77f737f361ea80d00beb6d744073a5e2480ffbaa2e8a61c8ad07b44f41d3403eda9b6a5b20ff17f66f29f39c78ad509ce570b2aa60e72eb6030f6')
conflicts=('spark-svn')

package() {
    cd "${srcdir}"
    msg2 "Extracting the data.tar.gz..."
    bsdtar -C "${pkgdir}" -xf data.tar.gz
    chmod +x "${pkgdir}"/opt/Spark/bin/startup.sh
}
