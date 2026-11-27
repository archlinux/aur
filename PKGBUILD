# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=telert
pkgver=0.3.0
pkgrel=1
pkgdesc="Alerts when commands finish, code runs or system events happen"
arch=('any')
url="https://github.com/navig-me/telert"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-ping3' 'python-psutil' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/telert/telert-${pkgver}.tar.gz")
sha256sums=('96d6f0dd09cd955ffb2567ef6e7bc37ce93dfbaf21318d25e93b5b3d16d57b6e')

build() {
  cd "telert-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "telert-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
