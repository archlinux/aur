# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf
pkgver=0.1
pkgrel=1
pkgdesc='Fairly Usable cli Filebrowser.'
arch=('any')
url=https://github.com/ckath/fuf
license=('MIT')
makedepends=('git')
optdepends=('w3m: image previews')
conflicts=('fuf-git')
provides=('fuf')
install=fuf.install
source=("$pkgname::git+https://github.com/ckath/fuf.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fuf "$pkgdir/usr/bin/fuf"
  install -Dm755 scripts/open "$pkgdir/usr/lib/$pkgname/open"
  install -Dm755 scripts/preview "$pkgdir/usr/lib/$pkgname/preview"
  
}
