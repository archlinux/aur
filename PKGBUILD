# Maintainer: j605

_name="vega_datasets"
pkgname="python-${_name}"
pkgver=0.5.0
pkgrel=1
pkgdesc="A Python package for offline access to Vega datasets"
arch=('any')
url="http://github.com/altair-viz/vega_datasets"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/ee/82/7a9e60a45c0fd32127c9badc3d22f59b0780276bfc3d1bc9a091b5709ade/$_name-$pkgver.tar.gz")
sha256sums=("1fa672ba89ded093b30c6d59fce10aca3ac7c927df254e588da7b6d14f695181")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
