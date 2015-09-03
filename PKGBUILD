# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=zoom
pkgver=1.0.22331.0731
pkgrel=5
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('desktop-file-utils' 'lib32-libxml2' 'lib32-libsm' 'lib32-sqlite' 'lib32-libxrender'
         'lib32-fontconfig' 'lib32-libxcomposite' 'lib32-libxi' 'lib32-libgl' 'lib32-openssl'
         'lib32-libxslt' 'lib32-libpulse' 'lib32-glib2' 'gst-plugins-base-libs' 'lib32-libxcb')
# The dependencies were reconstructed in order to fit the ones from debian
options=(!strip)
install=${pkgname}.install
source=("https://zoom.us/client/latest/ZoomInstaller_i386.deb")
md5sums=('519689cc7b2b399adf12ffbe41adef46')

package() {
    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
    chmod -R g-w opt
    mv opt "${pkgdir}"

    # Refering to the online license
    mkdir -p "${pkgdir}"/usr/share/licenses/zoom/
    echo "Please refer to https://zoom.us/terms for detailed license information." > "${pkgdir}"/usr/share/licenses/zoom/LICENSE
}
