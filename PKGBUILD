# Maintainer: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=7.0.7
pkgrel=1
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal). Binary release (GTK2)'
arch=(x86_64)
url='http://sourceforge.net/projects/lazpaint/'
license=(GPL3 LGPL)
depends=(gtk2 desktop-file-utils)
provides=("${_pkgname}")
conflicts=("${_pkgname}-qt4" "${_pkgname}-gtk2")
source=("https://github.com/bgrabitmap/lazpaint/releases/download/v7.0.7/lazpaint7.0.7_linux64.deb")
sha256sums=(SKIP)
prepare() {
    cd $srcdir
    tar xf data.tar.xz
}

package() {
    cd $srcdir

    cp -Rf ./usr $pkgdir

    chmod a+x $pkgdir/usr/bin/lazpaint
}
