pkgname=findr
pkgver=1.0.0
pkgrel=1
options=(!debug strip)
pkgdesc="Fast recursive file and directory name search tool"
arch=('x86_64')
url="https://github.com/Evr5/findr"
license=('MIT')
depends=()
makedepends=('gcc' 'make' 'cmake')
source=("https://github.com/Evr5/findr/releases/download/v1.0.0/findr.tar.gz")
sha256sums=('35f6f9283602c4049450c475acc2b08dfd782f8e03a3ef714c9f08890188d6b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/findr" "$pkgdir/usr/bin/findr"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}