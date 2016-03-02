pkgname=subuser
_name=subuser
pkgver=0.5.3
pkgrel=1
pkgdesc="Run programs in linux with selectively restricted permissions"
url="http://subuser.org"
depends=('python' 'docker')
makedepends=('python')
optdepends=()
license=('LGPL3')
arch=('any')
source=("https://github.com/subuser-security/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('8bf4600559709d3799cb1d2ca46bd1c55060ac4f8da00346b99a113e67643507')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
