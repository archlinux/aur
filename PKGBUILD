# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-pycm
pkgver=4.6
pkgrel=1
pkgdesc="Multi-class confusion matrix library for Python"
arch=('any')
url="https://github.com/sepandhaghighi/pycm"
license=('MIT')
depends=('python' 'python-art' 'python-numpy')
optdepends=(
  'python-matplotlib: plotting confusion matrices'
  'python-seaborn: heatmap plots'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pycm/pycm-${pkgver}.tar.gz")
sha256sums=('f0b52b2a75505faa6ff61e3395af5f632b81dd44e2215adf9f9d63c61ebd04e3')

build() {
  cd "pycm-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pycm-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
