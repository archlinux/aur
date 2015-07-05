# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=concordance-cli
_pkgsrcname=concordance
pkgver=1.2
pkgrel=1
pkgdesc='A CLI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libconcord=1.2')
source=("http://downloads.sourceforge.net/project/$_pkgsrcname/$_pkgsrcname/$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('ce9f23dfcd9bb1de79edd07231062c5e5d5fdefb3dd88ae6da7fb25b8d782434')

build() {
  cd "$srcdir/$_pkgsrcname-$pkgver/$_pkgsrcname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/$_pkgsrcname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
