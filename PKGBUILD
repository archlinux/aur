# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=macaon
pkgver=5.0.0
pkgrel=1
pkgdesc="A natural language processing (NLP) toolchain that can work on ambiguous inputs (word lattices)."
arch=(i686 x86_64)
url="http://macaon.lif.univ-mrs.fr/"
license=('GPL')
groups=()
depends=(glib2 libxml2 gfsm)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url/uploads/macaon/packages/sources/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(e656b0a4fa3b51140b437ee9ef46f136) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
