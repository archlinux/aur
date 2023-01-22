# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.1
pkgrel=1
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go>=1.19')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('484bd2fac9f73c61b36b83086ce51fc69c60a99aa149e6e96fe413fa27747281')
sha512sums=('6b71475ce85f81029f783f59c823820bae80c71c46446cf450af9bf969a33fc69d5ebf3ded21b8f78150ada7d1010b99a0333d9ab6fe1f815d22ea27c671614d')

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

