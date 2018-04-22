# Maintainer: Joop Kiefte <ikojba@gmail.com>

pkgname=e
pkgver=0.1
pkgrel=1
pkgdesc="A modern line editor with JavaScript capabilities"
arch=('x86_64' 'i686')
url="https://github.com/LaPingvino/$pkgname"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/LaPingvino/$pkgname/archive/v$pkgver.zip")
sha256sums=('048e94efc17c2f4ae5d32fb0ba21b0d2e04f5034bc43201fc6d4f1efb478fd89')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
