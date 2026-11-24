# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=telert
pkgver=0.2.9
pkgrel=1
pkgdesc="Alerts when commands finish, code runs or system events happen"
arch=('any')
url="https://github.com/navig-me/telert"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-ping3' 'python-psutil' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/telert/telert-${pkgver}.tar.gz")
sha256sums=('3e629699feb370e52bf5127322d4ea199dcbb8e1721eccee8037c41dba831182')

build() {
  cd "telert-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "telert-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
