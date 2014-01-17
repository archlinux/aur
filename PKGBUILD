# Maintainer: Marti Raudsepp <marti@juffo.org>
_pypi_name='Pyphen'
pkgver=0.9.1
pkgrel=1
pkgdesc="Library to hyphenate text using included or external Hunspell hyphenation dictionaries"
license=('GPL2' 'LGPL2.1' 'MPL')
arch=('any')
url="http://pyphen.org/"
makedepends=('python2')
depends=()
pkgname="python2-pyphen"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("https://pypi.python.org/packages/source/${_pypi_name_inital}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pypi_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  #rm -rf "$pkgdir/usr/bin"  # Avoid a conflict: only keep the Py3 executable.
}
md5sums=('024fe88b78e7b65f02cba1c3165223e6')
