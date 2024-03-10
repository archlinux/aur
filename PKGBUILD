pkgname=lexido
pkgver=1.1
pkgrel=1
pkgdesc="Lexido is a smart assistant for the Linux command line, powered by Gemini Pro 1.0."
arch=("x86_64")
url="https://github.com/micr0-dev/lexido"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/micr0-dev/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5d19e7ac0e7ed59043e1d2759db38bca64f4c0981404b3fd5adfa478d2bb5547')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
