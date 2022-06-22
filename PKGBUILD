# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad
pkgver=22.2.05
pkgrel=1
pkgdesc="CAD Software for People Who Build the Future"
arch=('x86_64')
url='https://www.bricsys.com/'
license=('custom')
depends=('qt5-gamepad' 'qt5-3d' 'qt5-wayland' 'qt5-serialport' 'openmotif' 'webkit2gtk' 'libxcrypt-compat' 'nss' 'glu' 'libffi6' 'alsa-lib')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-V${pkgver}-1-en_US.x86_64.rpm")
sha256sums=('26bc444be260f00719757ad82861cc8da2c6d71fdc43605c7a07faa840c205fc')

options=(!strip)
install='bricscad.install'

prepare() {
    mkdir var/bricsys/{Components,RenderMaterials/UserMaterials}
    chmod 777 var/bricsys/{Components,RenderMaterials/UserMaterials}
}

package() {
    mv opt usr var $pkgdir/
}
