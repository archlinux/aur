# Contributor: Bruno Gomes <bgomes@opens1.com>, Lucas Castro <lucas@opens1.com>

pkgname=python-pyfprint-git
pkgver=r12.e682eb1
pkgrel=1
pkgdesc="Python bindings for the libfprint fingerprinting library"
url="https://github.com/luksan/pyfprint"
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('python' 'libfprint')
makedepends=('swig')
source=("git+https://github.com/xantares/pyfprint.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pyfprint"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pyfprint"
  python setup.py build
} 

package() {
  cd "${srcdir}/pyfprint"
  python setup.py install --root=${pkgdir}
}
