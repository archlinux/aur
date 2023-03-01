# Maintainer: Vojtěch Balák <vojtech@balak.me>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Brian Schubert <bewschubert@gmail.com>

pkgname=ifm
pkgver=5.5
pkgrel=1
pkgdesc="A language and a program for keeping track of your progress through an Interactive Fiction game."
arch=('x86_64')
url="https://git.sr.ht/~zondo/ifm"
license=('GPL')
depends=('tk' 'perl')
makedepends=('tk' 'help2man')
source=("https://git.sr.ht/~zondo/ifm/archive/$pkgver.tar.gz")
md5sums=('347e173dffc9091827491f4afee9753f')
options=('docs')

build() {
    cd $srcdir/$pkgname-$pkgver

    sh autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir docdir=$pkgdir/usr/share/doc install
}
