# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname='specter'
pkgname=python-specter
pkgver=0.10.1
pkgrel=1
pkgdesc="A toolkit for simulating multi-object spectrographs"
arch=(any)
url="https://github.com/desihub/specter"
license=('custom')
depends=('python-setuptools')
source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('47d3397766dae3b0ab5370200d4b10d03cccd2e70a9d982c2f1f2eaeb497b442')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
  python setup.py install --root="$pkgdir"
}

