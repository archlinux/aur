# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=python-cli-ui
pkgver="0.6.0"
pkgrel=1
pkgdesc="Build nice user interfaces in the terminal"
url="http://github.com/TankerApp/python-cli-ui"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-unidecode' 'python-tabulate' 'python-setuptools')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/13/71/0204da083e1cc542e34f3b385b5dcfcedd6008f00f71451b5cfc9ae5cbff/python-cli-ui-0.6.0.tar.gz')
checkdepends=('python-pytest')
md5sums=('daccc4fc60379a12b348d0e138a62830')

build() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  pytest
}

package() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/python-cli-ui
  install LICENSE $pkgdir/usr/share/licenses/python-cli-ui/LICENSE
}

# vim:set ts=2 sw=2 et:
