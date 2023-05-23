# Maintainer: Schmetzler domink.wetzel[at]fh-zwickau[dot]de
# Contributor: mnabila nblid48[at]gmail[dot]com

pkgname=jupyterlab-desktop-bin
pkgver=4.0.0
pkgrel=1
_srcrel=1
pkgdesc="JupyterLab desktop application, based on Electron."

url="https://github.com/jupyterlab/jupyterlab-desktop"
license=("MIT")

arch=('x86_64')
source=("https://github.com/jupyterlab/jupyterlab-desktop/releases/download/v$pkgver-${_srcrel}/JupyterLab-Setup-Debian.deb")

sha256sums=('43a8fc2794c8473d504c06edeef30e819bdcbca217c07f28c4c3693169a2f2db')

prepare(){
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
    cd $srcdir
    mv usr $pkgdir/
    mv opt $pkgdir/
    mkdir $pkgdir/usr/bin
    ln -s /opt/JupyterLab/jupyterlab-desktop $pkgdir/usr/bin/jlab
}
