# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-striprtf
pkgver=0.0.35
pkgrel=1
pkgdesc="Convert RTF to plain text"
arch=('any')
url="https://github.com/joshy/striprtf"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/striprtf/striprtf-${pkgver}.tar.gz")
sha256sums=('a21e8c4f73a791c3f23561df96701488c691ab1749a92487cc9e5fee6ea08455')

build() {
  cd "striprtf-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "striprtf-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
