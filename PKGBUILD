pkgname=lexido
pkgver=1.0.1
pkgrel=1
pkgdesc="Lexido is a smart assistant for the Linux command line, powered by Gemini Pro 1.0."
arch=("x86_64")
url="https://github.com/micr0-dev/lexido"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/micr0-dev/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b445e6ed387a5b5e71ab285542f5179cd7ab0f84a60ea2e394a99db18eacaa57')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
