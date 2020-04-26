# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=python-tabula
pkgver=2.1.0
pkgrel=1
pkgdesc='Simple wrapper for tabula, read tables from PDF into DataFrame'
url="https://github.com/chezou/tabula-py"
license=('MIT')
arch=('any')
provides=('python-tabula')
makedepends=('python-setuptools')
depends=('java-runtime' 'python' 'python-pandas' 'python-requests' 'python-numpy')
_name="tabula-py"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha512sums=('91d1005d4873322a4da24191aafc20f8498d8c548696169a6a8f18392a2ff9f6049e26f1406a5d553c47c20de94ac310819a9019ec7b8d53a11401ebb6642602')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
