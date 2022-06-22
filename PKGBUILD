# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad-cn
pkgver=22.1.06
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future (Simplified Chinese)"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')

provides=('bricscad')
conflicts=('bricscad')
depends=('qt5-gamepad' 'qt5-3d' 'qt5-wayland' 'qt5-serialport' 'qt5-location' 'openmotif' 'webkit2gtk' 'libxcrypt-compat' 'glu' 'libffi6')
optdepends=('bricscad-communicator>=22: Addtional import/export file format support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-zh_CN-amd64.deb")
sha256sums=('06a803e221840c94d7b22420fcc26926a27023280556b29f5f219272da1c836d')

options=(!strip)
install='bricscad-cn.install'

prepare() {
    tar -xpf data.tar.xz

    find . -type d -exec chmod 755 {} \;

    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod 777 var/bricsys/{Components,RenderMaterials/UserMaterials}
}

package() {
    mv opt usr var $pkgdir/
}
