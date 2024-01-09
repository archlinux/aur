# Maintainer: Ashley Stewart <a.stewart.au@gmail.com>

pkgname=neurodeskapp-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="NeurodeskApp, based on JupyterLab desktop application, based on Electron."
url="https://github.com/NeuroDesk/neurodesk-app"
license=("BSD-3-Clause")
arch=('x86_64')
depends=('docker')
source=("https://github.com/NeuroDesk/neurodesk-app/releases/download/v${pkgver}/NeurodeskApp-Setup-Debian.deb")
sha256sums=('5dfab0cd3278c7dd26b91130ad2f436688180fd7421701b71cbe1a74c08b6f8a')

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
