pkgname=kbuilder
pkgver=0.1.0
pkgrel=1
pkgdesc="A bash script for building custom kernel packages for Arch Linux"
arch=("x86_64")
url="https://github.com/AnnikaV9/$pkgname"
license=("Unlicense")
provides=("$pkgname")
depends=("run-parts" "sed" "sudo" "curl" "coreutils")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkname-$pkgver.tar.gz")
b2sums=('3e53b6a692732b891fb5215b693d9043e5b803c18724b8c8133431df486dca9d6659d343d69a7d1a6cf7224194089692fdd4ddccf6980118551ec26f0f9f2abf')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/kbuilder" "$pkgdir/usr/bin/kbuilder"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo mkdir -p /etc/kbuilder/hooks
}
