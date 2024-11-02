# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=4.28.1
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop. Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/store/item/desktop"
depends=('glibc' 'hicolor-icon-theme' 'gdk-pixbuf2' 'cairo' 'gtk3' 'gcc-libs' 'pango' 'openssl' 'libsoup3' 'glib2' 'webkit2gtk-4.1' 'libappindicator-gtk3')
conflicts=("${pkgname}")
source=("https://files.getgrass.io/file/grass-extension-upgrades/ubuntu-22.04/grass_${pkgver}_amd64.deb")
sha256sums=('94644eb80c2469aa46d48d9f0a5920dc3aa107cf382b7a8a7c8d09520e20191a')
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
