# Maintainer: hengtseChou <hankthedev@gmail.com>
pkgname=lnk
pkgver=0.3.0
pkgrel=1
pkgdesc="🔗 Git-native dotfiles management that doesn't suck. "
arch=('x86_64' 'aarch64')
url="https://github.com/yarlson/lnk"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yarlson/lnk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf9f329d194a4f267f2d8684fc658c862ee003f712ba58b75ed970f6ea0368a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o lnk .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 lnk "$pkgdir/usr/bin/lnk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
