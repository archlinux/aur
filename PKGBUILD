# Maintainer: Ashley Stewart <a.stewart.au@gmail.com>

pkgname=neurodeskapp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="NeurodeskApp, based on JupyterLab desktop application, based on Electron."
url="https://github.com/NeuroDesk/neurodesk-app"
license=("BSD-3-Clause")
arch=('x86_64')
source=("https://github.com/NeuroDesk/neurodesk-app/releases/download/v${pkgver}/NeurodeskApp-Setup-Debian.deb")
sha256sums=('4846f5ba4a2dc22f8e1ecaef64f3fd415b9d7e3d09943ddabf0ba1f7c2ffaef9')

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
