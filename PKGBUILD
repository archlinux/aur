# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed
pkgver=1.0.3
pkgrel=1
pkgdesc="gtk3 pluma fork. Maintained by Linux Mint developers."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm')
makedepends=('git' 'mate-common' 'iso-codes')
provides=($_pkgname)
conflicts=('xed-git')
url='https://github.com/linuxmint/xed'
install=xed.install

source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2c0ada079023f0b6b2f7af10c4f5166d')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --with-gtk=3.0 --prefix="/usr"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

