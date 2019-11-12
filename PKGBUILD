# Maintainer: David Birks <david@tellus.space>

pkgname=conftest
pkgver=0.15.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('5291680b36de882860d2a80795de9a2335d4e639575a09b3844be4d6d2e1593173829717aecaef8247790a90bf1a20e8b9a8cb1810779089faf4a3ee9e18b967')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/instrumenta/conftest/commands.version=$pkgver" \
  -o conftest \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
