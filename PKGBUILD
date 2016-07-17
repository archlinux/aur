pkgname=subuser
_name=subuser
pkgver=0.5.11
pkgrel=1
pkgdesc="Run programs in linux with selectively restricted permissions"
url="http://subuser.org"
depends=('python' 'docker')
makedepends=('python')
optdepends=()
license=('LGPL3')
arch=('any')
source=("https://github.com/subuser-security/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('5be72dd366b3a6ac21fb560642d38563e1ce5fe041069fd4d2f75007f0b639ea')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
