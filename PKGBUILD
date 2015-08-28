# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=zoom
pkgver=1.0.22331.0731
pkgrel=3
pkgdesc="Start or join Zoom meetings"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('lib32-libxml2' 'lib32-libsm' 'lib32-sqlite' 'lib32-libxrender' 'lib32-fontconfig' 'lib32-libxcomposite' 'lib32-libxi' 'lib32-libgl')
options=(!strip)
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
