pkgname=hyper
pkgver=0.1.1
pkgrel=1
pkgdesc="A Lightweight Web Browser"
arch=(any)
url="https://github.com/AxelMarchand/Hyper"
license=('MIT')
depends=('webkitgtk')
makedepends=('make' 'gcc' 'pkg-config')
source=('https://github.com/AxelMarchand/Hyper/releases/download/v0.1.1/hyper-0.1.1.tar.gz')
md5sums=('057970f90e9650f36faccc17e5f2061c')

build() {
    cd $srcdir/$pkgname-$pkgver

    make || return 1
    make clean
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install || return 1
}
