pkgname=python-icmplib
pkgver=3.0.3
pkgrel=1
pkgdesc="Easily forge ICMP packets and make your own ping and traceroute."
depends=('python')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/ValentinBELYN/icmplib"
license=('LGPL3')
source=("https://github.com/ValentinBELYN/icmplib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b628d930ff454bd2094c1560c1884626251ef895fdba5ed7db8a841bbe8875cf')

build() {
  cd "${srcdir}/icmplib-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/icmplib-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
