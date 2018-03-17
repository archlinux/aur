# Maintainer: Samuel Littley <aur@toastwaffle.com>
pkgname=python2-pytype
pkgver=latest
pkgrel=1
pkgdesc="Static type checking for Python 2 and 3"
arch=('i686' 'x86_64')
url="https://github.com/google/pytype"
license=('apache-2.0')
depends=('python2' 'python2-pyaml')
provides=('pytype')
conflicts=('pytype')
makedepends=('git')
options=(!emptydirs)
source=('git+git://github.com/google/pytype.git')
md5sums=('SKIP')

package() {
  cd "${srcdir}/pytype"
  git submodule init
  git submodule update
  python2 setup.py install \
      --prefix=/usr \
      --root="${pkgdir}" \
      --optimize=1
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
