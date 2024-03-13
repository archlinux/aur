# Maintainer: Schmetzler domink.wetzel[at]fh-zwickau[dot]de
# Contributor: mnabila nblid48[at]gmail[dot]com

pkgname=jupyterlab-desktop-bin
pkgver=4.1.4
pkgrel=1
_srcrel=1
pkgdesc="JupyterLab desktop application, based on Electron."

url="https://github.com/jupyterlab/jupyterlab-desktop"
license=("MIT")

arch=('x86_64')
source=("https://github.com/jupyterlab/jupyterlab-desktop/releases/download/v$pkgver-${_srcrel}/JupyterLab-Setup-Debian-x64.deb")

sha256sums=('1ed61255abcfe9ad6953fc35017708ec1b0e13862830c78a19ce983c165ff673')

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
