# Maintainer: j605

_name="vega_datasets"
pkgname="python-${_name}"
pkgver=0.9
pkgrel=1
pkgdesc="A Python package for offline access to Vega datasets"
arch=('any')
url="http://github.com/altair-viz/vega_datasets"
license=('MIT')
depends=('python')
source=("$_name-$pkgver.tar.gz::https://github.com/altair-viz/vega_datasets/archive/v$pkgver.tar.gz")
sha256sums=('863a1c0f2da1310a0d676cae4c0f74ce7cb0aaa822909ea6f6e96eeaf4d348b1')

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
