# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=6.1.2
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/store/item/desktop"
depends=('glibc' 'hicolor-icon-theme' 'gdk-pixbuf2' 'cairo' 'gtk3' 'gcc-libs' 'pango' 'openssl' 'libsoup3'
    'glib2' 'webkit2gtk-4.1' 'libappindicator-gtk3')
conflicts=("${pkgname}")
source=("https://files.getgrass.io/file/grass-extension-upgrades/v${pkgver}/Grass_${pkgver}_amd64.deb")
sha256sums=('687d7105b9d69b7f39989c06bee14912f3dd79b1066e55022ea728929ae1a914')

prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
}


package() {
    cp -ar ${srcdir}/usr ${pkgdir}/
}
