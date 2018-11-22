# Maintainer: j605

_name="vega_datasets"
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=1
pkgdesc="A Python package for offline access to Vega datasets"
arch=('any')
url="http://github.com/altair-viz/vega_datasets"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/23/af/021b51c73c4676544fdf47e80f82b2ed5f96e5717e4fb9d611dd661420ce/$_name-$pkgver.tar.gz")
sha256sums=("a38d25bcb9dbf06d4b8adfa25fc4fed19f329e3be4d9b55ebd1395574c2bf30b")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
