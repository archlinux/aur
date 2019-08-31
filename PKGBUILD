# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf
pkgver=0.1
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
md5sums=('b71cc7ddbe66bc675a4e5738edfc410a')

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
