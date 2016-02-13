pkgname=subuser
_name=subuser
pkgver=0.5
pkgrel=1
pkgdesc="Run programs in linux with selectively restricted permissions"
url="http://subuser.org"
depends=('python' 'docker')
makedepends=('python')
optdepends=()
license=('LGPL3')
arch=('any')
source=("https://github.com/subuser-security/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('8fd4ccd8aff7c6ba760411346f655e2fd9a5a2ab75c924785449059bea1cbf36')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
