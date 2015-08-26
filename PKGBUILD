# Maintainer: vorpalblade <vorpalblade77@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: David Danier <david.danier@team23.de>
pkgname=python2-path
pkgver=7.7.1
pkgrel=1
pkgdesc="path.py provides a class (path) for working with files and directories. Less typing than os.path, more fun, a few new tricks"
arch=('any')
url="https://pypi.python.org/pypi/path.py"
# There isn't a license file in the repository, but there are the appropriate
# headers.
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/path.py/path.py-${pkgver}.tar.gz)
sha256sums=('692feac9d1fe3b70239b2f0f07dcdbbdad38e3611846924de33ec6175d87638e')

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
