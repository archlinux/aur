# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=5.1.1
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
source=("https://files.getgrass.io/file/grass-extension-upgrades/ubuntu-22.04/Grass_${pkgver}_amd64.deb")
sha256sums=('3b682276eade22ad7a5e7be07ff59d252a3e046172a84aa2fd8ff313dcce6109')


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
}


package() {
    cp -ar ${srcdir}/usr ${pkgdir}/
}
