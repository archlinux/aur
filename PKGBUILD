pkgname=python-icmplib
pkgver=3.0.2
pkgrel=1
pkgdesc="Easily forge ICMP packets and make your own ping and traceroute."
depends=('python')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/ValentinBELYN/icmplib"
license=('LGPL3')
source=("https://github.com/ValentinBELYN/icmplib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82a9938f621caab5395d77011c903ef3c96925bcddce944a8857b0c8e34bc125')

build() {
  cd "${srcdir}/icmplib-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/icmplib-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
