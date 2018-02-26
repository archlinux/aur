# Maintainer: illis
# Contributor: bchretien
pkgname=subuser
_name=subuser
pkgver=0.6.2
pkgrel=1
pkgdesc="Run programs in linux with selectively restricted permissions"
url="http://subuser.org"
depends=('python3' 'docker')
makedepends=('python3')
optdepends=()
license=('LGPL3')
arch=('any')
source=("https://github.com/subuser-security/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('1f7fc32fd61f1f8c7d04770cf4ba5c0dd0eb081eb1ef35f35e07c667959555a1')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
