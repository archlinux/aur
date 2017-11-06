# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name='declxml'
pkgname='python-declxml-git'
pkgver=r59.e451dab
pkgrel=1
pkgdesc="Declarative XML processing for Python."
arch=('x86_64')
url="https://github.com/gatkin/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-declxml')
conflicts=('python-declxml')
options=(!emptydirs)
source=("git+https://github.com/gatkin/${_name}.git")
md5sums=('SKIP')

pkgver() {  # Number of revisions since beginning of history
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
