# Maintainer : Ezekiel Bethel <mctinfoilball@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=setuptools_darcs
pkgver=1.2.11
pkgrel=3
pkgdesc="Python setuptools plugin for darcs"
arch=('any')
url='http://pypi.python.org/pypi/setuptools_darcs'
license=('GPL')
groups=()
depends=('python2')
makedepends=('setuptools' 'darcsver')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=( http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz )
noextract=()
md5sums=('79451a8e77b9692861a655e53df094f0')

build()
{
  cd "$srcdir/$pkgname-$pkgver" || return 1
  python2 setup.py build || return 1
}

check()
{
  cd "$srcdir/$pkgname-$pkgver" || return 1
  python2 setup.py test || return 1
}

package()
{
  cd "$srcdir/$pkgname-$pkgver" || return 1
  python2 setup.py install --root="$pkgdir" || return 1
}
