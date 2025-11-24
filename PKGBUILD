# Maintainer: erdii <me at erdii dot engineering>
pkgname=ramalama
pkgver=0.14.0
pkgrel=0
pkgdesc="The goal of RamaLama is to make working with AI boring."
arch=('any')
url="https://github.com/containers/ramalama"
license=('MIT')
depends=('python-argcomplete' 'python-jsonschema' 'python-jinja')
makedepends=(python-build python-installer python-wheel python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0564bada1cc6fac2d45143024fd9b29219b7a7508f1d591cbe14d8e6db363b2c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
