# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf
pkgver=0.1.5
pkgrel=1
pkgdesc='Fairly Usable cli Filebrowser.'
arch=('any')
url=https://github.com/ckath/fuf
license=('MIT')
depends=('ncurses')
optdepends=('w3m: image previews')
conflicts=('fuf-git')
provides=('fuf')
install=fuf.install
source=("https://github.com/Ckath/fuf/archive/v$pkgver-1.tar.gz")
md5sums=('ff8d3b5335e64a2e59bf56a1034f8a8b')

build() {
  cd "$srcdir/$pkgname-$pkgver-1"
  make VERSION="$pkgver-1"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-1"
  install -Dm755 fuf "$pkgdir/usr/bin/fuf"
  install -Dm755 scripts/open "$pkgdir/usr/lib/$pkgname/open"
  install -Dm755 scripts/preview "$pkgdir/usr/lib/$pkgname/preview"
  
}
