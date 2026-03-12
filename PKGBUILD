# Maintainer: Pedro (pedrodev2026) <pedrodev2026 at gmail dot com>
pkgname=pystatic
pkgver=0.1
pkgrel=1
pkgdesc="Uma linguagem de programação estilo Python que gera binários estáticos via transpilação para C"
arch=('any')
url="https://github.com/pedrodev2026/pystatic"
license=('BSD-3-Clause')
depends=('python')

source=("https://github.com/pedrodev2026/pystatic/releases/download/$pkgver/pystatic-$pkgver.tar.gz")
sha256sums=('0e44684f1ecc5feac2823a677e6920f305527155b78261cfd320950b6a568899')

build() {
  cd "$srcdir/pystatic-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pystatic-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

