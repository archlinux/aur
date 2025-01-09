# Maintainer: Ashley Stewart <a.stewart.au@gmail.com>

pkgname=neurodeskapp-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="NeurodeskApp, based on JupyterLab desktop application, based on Electron."
url="https://github.com/NeuroDesk/neurodesk-app"
license=("BSD-3-Clause")
arch=('x86_64')
depends=('docker')
source=("https://github.com/NeuroDesk/neurodesk-app/releases/download/v${pkgver}/NeurodeskApp-Setup-Debian.deb")
sha256sums=('bb708fb234c9151dd436e0b260164d0ec2402a9ae8ffc6aeb3bbf97bffceaa1c')

prepare() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
    cd $srcdir
    mv usr $pkgdir/
    mv opt $pkgdir/
    mkdir $pkgdir/usr/bin
    ln -s /opt/NeurodeskApp/neurodeskapp $pkgdir/usr/bin/neurodeskapp
}
