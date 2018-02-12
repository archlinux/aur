# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=exonerate
pkgver=2.2.0
pkgrel=2
pkgdesc='A general purpose tool for biological sequence comparison'
arch=('i686' 'x86_64')
url='https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate'
license=('GPL3')
depends=('glib2' 'pkgconfig')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('0ea2720b1388fa329f889522f43029b416ae311f57b229129a65e779616fe5ff')

build() {
  cd "$pkgname-$pkgver"
  export LDFLAGS="${LDFLAGS},--no-as-needed"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
