# Maintainer: Ashley Stewart <a.stewart.au@gmail.com>

pkgname=neurodeskapp-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="NeurodeskApp, based on JupyterLab desktop application, based on Electron."
url="https://github.com/NeuroDesk/neurodesk-app"
license=("BSD-3-Clause")
arch=('x86_64')
depends=('docker')
source=("https://github.com/NeuroDesk/neurodesk-app/releases/download/v${pkgver}/NeurodeskApp-Setup-Debian.deb")
sha256sums=('c753425866730dff83d2fe4cfef0786ce5a13dc6440e24943b9f674f79e12d4d')

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
