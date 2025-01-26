# Maintainer: Your Name <traxes719@gmail.com>
pkgname=pystat
pkgver=0.1.0
pkgrel=1
pkgdesc="A small Pyton script to showing basic system information and your favourite snake."
arch=('x86_64')
url="https://github.com/snomfake/pystat"
license=('MIT')
depends=('python' 'python-pip' 'cython')
source=("https://github.com/snomfake/pystat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1f782d43e6c4ef6f47d7d940a343496adc3526af3e6a80b608105567d600859')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cython pystat.py --embed
  gcc -Os $(python3-config --includes) pystat.c -o pystat $(python3-config --ldflags --embed)
  install -Dm755 pystat "$pkgdir/usr/bin/pystat"
}
