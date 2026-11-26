# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-opem
pkgver=1.4
pkgrel=1
pkgdesc="Open-source PEM fuel cell simulation tool"
arch=('any')
url="https://github.com/ECSIM/opem"
license=('MIT')
depends=('python' 'python-art' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/o/opem/opem-${pkgver}.tar.gz")
sha256sums=('41e63dc198a5752a16a375a764bd2fc56093219e3bc8c15ee315fbe146c5e5b2')

build() {
  cd "opem-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "opem-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
