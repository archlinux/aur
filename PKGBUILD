# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=7.4.4
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/store/item/desktop"
depends=('glibc' 'hicolor-icon-theme' 'gdk-pixbuf2' 'cairo' 'gtk3' 'libsoup3'
    'glib2' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator-glib')
conflicts=("${pkgname}")
source=("https://files.getgrass.io/file/grass-extension-upgrades/v${pkgver}/grass-desktop_${pkgver}_amd64.deb")
sha256sums=('ab6038bb3a75e928b72b1f1d78b5d207f501bb41b4d0b7ce9ae5c99c006648e4')

prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
}


package() {
    cp -ar ${srcdir}/usr ${pkgdir}/
}
