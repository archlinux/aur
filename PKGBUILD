# Maintainer: Schmetzler domink.wetzel[at]fh-zwickau[dot]de
# Contributor: mnabila nblid48[at]gmail[dot]com

pkgname=jupyterlab-desktop-bin
pkgver=3.6.1
pkgrel=2
_srcrel=2
pkgdesc="JupyterLab desktop application, based on Electron."

url="https://github.com/jupyterlab/jupyterlab-desktop"
license=("MIT")

arch=('x86_64')
source=("https://github.com/jupyterlab/jupyterlab-desktop/releases/download/v$pkgver-$_srcrel/JupyterLab-Setup-Debian.deb")

md5sums=('98f446b5a1b9dab747b84e59fbc5d08c')

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
