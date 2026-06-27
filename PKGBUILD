# Maintainer: Shahriyar <shahriyardx@github.com>

pkgname=brightctrl
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight DDC/CI external monitor brightness controller (TUI + CLI)"
arch=("x86_64")
url="https://github.com/shahriyardx/brightctrl"
license=("MIT")
depends=()
source=("brightctrl-$pkgver::$url/releases/download/v$pkgver/brightctrl"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=("e887de3e00cba858f588e7b64c2506112524b932c2a0d9b79f6eabfc7e0a9dfe"
            "c953229204806554e12143a6e2f4236f5016baa6925579ee13d559b79aae695c")

package() {
  install -Dm755 "$srcdir/brightctrl-$pkgver" "$pkgdir/usr/bin/brightctrl"
  ln -s brightctrl "$pkgdir/usr/bin/bctrl"
  ln -s brightctrl "$pkgdir/usr/bin/bc"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
