# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-streaming-form-data'
_name=${pkgname#python-}
pkgver=1.14.0
pkgrel=1
pkgdesc="Streaming multipart/form-data parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/siddhantgoel/streaming-form-data"
license=('custom:MIT')
makedepends=('python-setuptools')
depends=('python-smart_open')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('719e82a822de77acef8e46a70bce13823886ec37a3fdf977110c061605b5c945')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
