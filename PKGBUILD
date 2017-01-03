# Maintainer: Takashi Kokubun <takashikkbn@domain.com>
pkgname=xkremap
pkgver=0.0.3
pkgrel=1
pkgdesc="Dynamic key remapper for X Window System"
arch=('i686' 'x86_64')
url='https://github.com/k0kubun/xkremap'
license=('MIT')
depends=()
makedepends=('git')
source=("xkremap-$pkgver::git+https://github.com/k0kubun/xkremap.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/xkremap-$pkgver"
  make
}

package() {
  cd "$srcdir/xkremap-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr/bin" install
}
