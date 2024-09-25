# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=4.26.6
pkgrel=2
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop. Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/store/item/desktop"
depends=('glibc' 'hicolor-icon-theme' 'gdk-pixbuf2' 'cairo' 'gtk3' 'gcc-libs' 'pango' 'openssl' 'libsoup3' 'glib2' 'webkit2gtk-4.1' 'libappindicator-gtk3')
conflicts=('grass-desktop-node')
source=("https://files.getgrass.io/file/grass-extension-upgrades/ubuntu-latest/grass_${pkgver}_amd64.deb")
sha256sums=('a7d46dcf755655d1ffc80b8777c99c468b9042864611477d6ea213d0ce0b2e75')
options=('!strip')


prepare() {
    cd ${srcdir}
    mkdir grass
    bsdtar -x -f grass_${pkgver}_amd64.deb -C grass/
    rm grass_${pkgver}_amd64.deb
    bsdtar -x -f grass/data.tar.gz -C grass/
    rm grass/data.tar.gz
}


package() {
    cp -ar ${srcdir}/grass/usr ${pkgdir}/
}
