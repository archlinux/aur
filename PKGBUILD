# Maintainer: erdii <me at erdii dot engineering>
pkgname=ramalama
pkgver=0.11.1
pkgrel=0
pkgdesc="The goal of RamaLama is to make working with AI boring."
arch=('any')
url="https://github.com/containers/ramalama"
license=('MIT')
depends=('python-argcomplete')
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('61145f53d576d5bf215d84ebe9d35f55e1df3f96f71d15557ef7139624cab8fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
