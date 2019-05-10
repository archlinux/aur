# Maintainer: Mopi <mopi@dotslashplay.it>
pkgname=play.it
pkgver=2.11.2
pkgrel=1
pkgdesc="Easy way to install games on Linux"
arch=('any')
url="https://wiki.dotslashplay.it"
license=('BSD')
depends=()
makedepends=('pandoc')
optdepends=(
  'imagemagick'
 	'libarchive'
	'icoutils'
	'innoextract'
	'unzip'
)
source=("${pkgname}-${pkgver}.tar.gz::https://framagit.org/vv221/play.it/-/archive/${pkgver}/play.it-${pkgver}.tar.gz")
sha1sums=('b5a2dba4d61ea5b77e87714d3e862d48991facba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix="/usr" bindir="/usr/bin" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

