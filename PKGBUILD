# Contributors: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
#               Milan Hrabánek <hrabi@linuxwaves.com>
#               Anton Leontiev <bunder@t-25.ru>
#               Andrew Black <agwblack@gmail.com>

pkgname=poker-eval
pkgver=138.0
pkgrel=1
pkgdesc="C library to evaluate poker hands"
arch=('i686' 'x86_64')
url="http://gna.org/projects/pokersource/"
license=('GPL')
source=(http://download.gna.org/pokersource/sources/${pkgname}-${pkgver}.tar.gz)
md5sums=('8398b5b98c8ebd1cc03dfac96b477012')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd $pkgname-$pkgver
    make prefix=$pkgdir/usr/ install || return 1
}
