# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scikits-base
pkgver=1
pkgrel=2
pkgdesc="Files common for all SciKits packages"
arch=('any')
url="http://scikits.appspot.com/"
license=('BSD')
depends=('python2')
options=(!emptydirs)

source=("__init__.py" "LICENSE")
sha256sums=('d6442cf36f96caf84d9abeb3e15124961557309ba5aff38ed915d102a4f8d19e'
            '4e7b871c43c1aa35716986015b012e7858a698896bfbb9510629440c16a92584')

package() {
  cd "$srcdir"
  _target="$pkgdir/$(python2 -c 'from distutils.sysconfig import get_python_lib; \
	  print get_python_lib()')/scikits"
  install -D __init__.py "$_target/__init__.py"
  install -D LICENSE "$pkgdir/usr/share/licenses/scikits-base/LICENSE"
}

