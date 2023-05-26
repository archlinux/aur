# Maintainer: Ashley Stewart <a.stewart.au@gmail.com>

pkgname=neurodeskapp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="NeurodeskApp, based on JupyterLab desktop application, based on Electron."
url="https://github.com/NeuroDesk/neurodesk-app"
license=("BSD-3-Clause")
arch=('x86_64')
depends=('docker')
source=("https://github.com/NeuroDesk/neurodesk-app/releases/download/v${pkgver}/NeurodeskApp-Setup-Debian.deb")
sha256sums=('50faafbbe727a426c9dd965b47680ea0d40bbf2f1038b42bdd02168cc56ab0e4')

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
