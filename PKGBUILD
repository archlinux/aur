# Maintainer: vorpalblade <vorpalblade77@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: David Danier <david.danier@team23.de>
pkgname=python2-path
pkgver=7.6
pkgrel=1
pkgdesc="path.py provides a class (path) for working with files and directories. Less typing than os.path, more fun, a few new tricks"
arch=('any')
url="https://pypi.python.org/pypi/path.py"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/path.py/path.py-${pkgver}.tar.gz)
sha256sums=('5cdf60f359f1add18f8556c9a1855cbd1d517f0780e3d386c256515f698ba0e0')

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
