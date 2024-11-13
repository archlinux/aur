# Maintainer: codewithsarthak <codewithsarthak@proton.me>
pkgname=griptail
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight system information display tool"
arch=('x86_64')
url="https://github.com/codiwithsarthak/griptail"
license=('MIT')
depends=('glibc')

source=("https://github.com/codiwithsarthak/griptail/releases/download/v1.0.0.tar.gz/griptail-v1.0.0.tar.gz")

sha256sums=('2112b19a520e591db22f5e19cee903264fba3579360a387e7ca459266c6d1d2b')

prepare() {
  cd "$srcdir"
  tar -xvzf "$srcdir/griptail-v${pkgver}.tar.gz"
}

build() {
  cd "$srcdir/griptail"
  make
}

package() {
  cd "$srcdir/griptail"
  install -Dm755 griptail "$pkgdir/usr/bin/griptail"
}

