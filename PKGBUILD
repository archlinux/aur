# Maintainer: hwesselmann <hauke@h-dawg.de>
# Contributor: Amish <contact at via dot aur>
# Contributor: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark
pkgver=2.9.1
pkgrel=1
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('any')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
depends=('java-runtime' 'unixodbc' 'libxtst')
options=('!strip')
source=(http://download.igniterealtime.org/${pkgname}/${pkgname}_${pkgver//./_}.deb)
sha512sums=('65c015bba8c1616b06a40722d04b9a37271858ad2fa33ed52039c3be8f75f820fde37ec3883d5fd297dd784ba9a2e57ade8efe2cc97051405773588ae65ca3d5')
conflicts=('spark-svn')

package() {
    cd "${srcdir}"
    msg2 "Extracting the data.tar.gz..."
    bsdtar -C "${pkgdir}" -xf data.tar.gz
    chmod +x "${pkgdir}"/opt/Spark/bin/startup.sh
}
