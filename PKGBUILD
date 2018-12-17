# Maintainer: j605

_name="vega_datasets"
pkgname="python-${_name}"
pkgver=0.7.0
pkgrel=1
pkgdesc="A Python package for offline access to Vega datasets"
arch=('any')
url="http://github.com/altair-viz/vega_datasets"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/ec/f7/a937690cd73cdac61b7e70bb23c8a5486cb1ffb5d7e033882ef0f990cc5f/$_name-$pkgver.tar.gz")
sha256sums=('20d490b417f84607eb5079400f608f2e9c135b7092bee10f6857f6d23136e459')

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
