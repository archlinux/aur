# Maintainer: pzl

pkgname=shivavg
_pkgname=ShivaVG
pkgver=0.2.1
pkgrel=1
pkgdesc="OpenVG Implementation in OpenGL"
arch=('any')
url="http://shivavg.sourceforge.net/"
license=('LGPL' 'GPL')
depends=('glibc' 'libgl')
makedepends=('git' 'make')
optdepends=('libjpeg-turbo: display jpeg images')
provides=('libOpenVG.so')
conflicts=()
options=()
source=('git+https://github.com/ileben/ShivaVG.git')
sha256sums=('SKIP') #updpkgsums
md5sums=('SKIP') #makepkg -g


build() {
    cd "$srcdir/$_pkgname"
    sh autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
