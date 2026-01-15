# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-marshalparser
_name=${pkgname#python-}
pkgver=0.5.0 
pkgrel=1
pkgdesc='Parser for byte-cache .pyc files'
arch=(any)
url=https://pypi.org/project/marshalparser
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('63ca116b5fe06160a093fb6d86dfc934dfd3ce1b365f7f1415eb014c18cdac7a')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

