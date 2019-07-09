# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike: ArchStrike <team@archstrike.org>

pkgname=rifiuti2
pkgver=0.6.1
pkgrel=2
pkgdesc="A rewrite of rifiuti, a great tool from Foundstone folks for analyzing Windows Recycle Bin INFO2 file."
url="https://github.com/abelcheung/rifiuti2"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('custom:BSD')
depends=('glib2')
conflicts=('rifiuti')
options=('!emptydirs')
source=("https://github.com/abelcheung/rifiuti2/archive/${pkgver}.tar.gz")
sha512sums=('2e83b13dc15d05a770719048a1d8f503c63ac660c80d5ae14c859c51272b4ccc4091138504f128b2551113d0cd4c005ffadb0939cb2f3565916e9c97b733ae58')

build() {
  cd "$srcdir/rifiuti2-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --bindir=/usr/bin --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/rifiuti2-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/rifiuti2/LICENSE"
}
