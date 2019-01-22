# Maintainer: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=6.4.1
pkgrel=1
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal). Binary release (GTK2)'
arch=(x86_64)
url='http://sourceforge.net/projects/lazpaint/'
license=(GPL3 LGPL)
depends=(gtk2 desktop-file-utils)
provides=("${_pkgname}")
conflicts=("${_pkgname}-qt4" "${_pkgname}-gtk2")
source=("https://github.com/bgrabitmap/lazpaint/releases/download/v6.4.1/lazpaint_6.4.1_linux64.deb")
sha256sums=("4551896223a227e802fa8bdac0174f3be8d6e644b178ee493cd6038de30f78f0")

prepare() {
    cd $srcdir
    tar xf data.tar.xz
}

package() {
    cd $srcdir

    cp -Rf ./usr $pkgdir

    chmod a+x $pkgdir/usr/bin/lazpaint
}
