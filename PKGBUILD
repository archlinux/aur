# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf
pkgver=0.1.5
pkgrel=1
pkgdesc='Fairly Usable cli Filebrowser.'
arch=('any')
url=https://github.com/ckath/fuf
license=('MIT')
optdepends=('w3m: image previews')
conflicts=('fuf-git')
provides=('fuf')
install=fuf.install
source=("https://github.com/Ckath/fuf/archive/v$pkgver.tar.gz")
md5sums=('91c9c135a0c796a3a5140c61cd130ccd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 fuf "$pkgdir/usr/bin/fuf"
  install -Dm755 scripts/open "$pkgdir/usr/lib/$pkgname/open"
  install -Dm755 scripts/preview "$pkgdir/usr/lib/$pkgname/preview"
  
}
