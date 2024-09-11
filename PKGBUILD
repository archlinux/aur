# Maintainer: Schmetzler domink.wetzel[at]fh-zwickau[dot]de
# Contributor: mnabila nblid48[at]gmail[dot]com

pkgname=jupyterlab-desktop-bin
pkgver=4.2.5
pkgrel=1
_srcrel=1
_debname="JupyterLab-Setup-Debian-x64"
pkgdesc="JupyterLab desktop application, based on Electron."

url="https://github.com/jupyterlab/jupyterlab-desktop"
license=("MIT")

arch=('x86_64')
source=("$_debname-$pkgver-${_srcrel}.deb::https://github.com/jupyterlab/jupyterlab-desktop/releases/download/v$pkgver-${_srcrel}/$_debname.deb")

sha256sums=('123cd320d0dfb37041aa5c1887b386a766b224e453cf1ed6c5eec060bce96ae0')

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
