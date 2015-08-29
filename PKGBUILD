# Maintainer: vorpalblade <vorpalblade77@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: David Danier <david.danier@team23.de>
pkgname=python2-path
pkgver=8.1
pkgrel=1
pkgdesc="path.py provides a class (path) for working with files and directories. Less typing than os.path, more fun, a few new tricks"
arch=('any')
url="https://pypi.python.org/pypi/path.py"
# There isn't a license file in the repository, but there are the appropriate
# headers.
license=('MIT')
depends=('python2')
conflicts=('ipython2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/path.py/path.py-${pkgver}.tar.gz)
sha256sums=('27ea0789c12cbe8e2a29397d2a54581009094a0684ce880844ba9fc4c16ce30c')

build() {
  cd "${srcdir}/path.py-${pkgver}"
  python2 setup.py build || return 1
}
package() {
  cd ${srcdir}/path.py-${pkgver}
  python2 setup.py install --root="${pkgdir}" \
    --prefix=/usr \
    --compile \
    --optimize=1 || return 1
}
