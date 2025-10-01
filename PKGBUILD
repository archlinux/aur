# Maintainer: erdii <me at erdii dot engineering>
pkgname=ramalama
pkgver=0.12.3
pkgrel=0
pkgdesc="The goal of RamaLama is to make working with AI boring."
arch=('any')
url="https://github.com/containers/ramalama"
license=('MIT')
depends=('python-argcomplete')
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('666ce5a71c8560682a2ec9e83e97597d0d26c201e6b01222ef7d82b46f679ed7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
