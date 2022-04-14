# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname='specter'
pkgname=python-specter
pkgver=0.8.6
pkgrel=1
pkgdesc="A toolkit for simulating multi-object spectrographs"
arch=(any)
url="https://github.com/desihub/specter"
license=('custom')
depends=('python-setuptools')
source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('320f712b9fab419c872103e2952c0505e8d198fbb0acf5937e1770debd46ee01')

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

