# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=concordance-cli
_pkgsrcname=concordance
pkgver=1.5
pkgrel=1
pkgdesc='A CLI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='https://github.com/jaymzh/concordance/'
license=('GPL3')
depends=('libconcord=1.5')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('6e4ecfc18b91586cc0c58e376a7e23a561cbd7e8756586e62d5d9450e1b42b25')

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
