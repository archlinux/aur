# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=compress_pickle
pkgname=python-compress-pickle
pkgrel=2
pkgver=2.1.0
pkgdesc="Standard pickle, wrapped with standard compression libraries"
arch=('i686' 'x86_64')
url="https://github.com/lucianopaz/compress_pickle"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('3e944ce0eeab5b6331324d62351c957d41c9327c8417d439843e88fe69b77991')

build() {
  cd ${srcdir}/$_name-$pkgver
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-$pkgver
  # install package
  python setup.py install --root="$pkgdir" --optimize=1

  # license
  install -Dm644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
