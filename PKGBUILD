pkgname=bricscad-cn
pkgver=22.1.06
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future (Simplified Chinese)"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')
depends=('qt5-gamepad' 'qt5-3d' 'qt5-wayland' 'qt5-serialport' 'qt5-location' 'openmotif' 'webkit2gtk' 'libxcrypt-compat' 'glu' 'libffi6')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-zh_CN.x86_64.rpm")
sha256sums=('74bdffb3ed421eb5e547f1641bafb0de9d5ac8add78c56e214f7f0973e16833a')

options=(!strip)
install='bricscad.install'

prepare() {
    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod 777 var/bricsys/{Components,RenderMaterials/UserMaterials}
}

package() {
    mv opt usr var $pkgdir/
}
