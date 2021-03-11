# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-streaming-form-data'
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="Streaming multipart/form-data parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/siddhantgoel/streaming-form-data"
license=('custom:MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('27ddc67333716a0b3a10f622e76a8ce5b9b7da124592c33e58405e55e2a7c357')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
