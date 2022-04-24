# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-streaming-form-data'
_name=${pkgname#python-}
pkgver=1.10.2
pkgrel=1
pkgdesc="Streaming multipart/form-data parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/siddhantgoel/streaming-form-data"
license=('custom:MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('532c7f70697fcc8a9a37b56495dcf36df11feefe42f626cff789beac11728f45')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
