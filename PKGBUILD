# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.2
pkgrel=1
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go>=1.19')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('80dcbc1bc4877bbef3eb30cb8c0ad7db161fb76d4999bb9b5f4a484e2267e5a1')
sha512sums=('37ca511089ce1491bddfead3b12e41ffa12f75132e681580377313aee68994128b31f2562472cbe59478ca765e55f3b5e58369a4d905ae35218bc706cdf595f0')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/udev/rules.d"
  install dotool dotoolc dotoold "$pkgdir/usr/bin/"
  install "80-dotool.rules" "$pkgdir/etc/udev/rules.d/"
}

