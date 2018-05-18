# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=python-cli-ui
pkgver="0.7.1"
pkgrel=2
pkgdesc="Build nice user interfaces in the terminal"
url="http://github.com/TankerApp/python-cli-ui"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-unidecode' 'python-tabulate' 'python-setuptools')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/41/09/21212e63d3e46052ee10eaff9d8bf182608a858574ed43f4649e08042c37/python-cli-ui-0.7.1.tar.gz')
checkdepends=('python-pytest')
md5sums=('633ca55ca0ec15776e02bce81686a8d8')

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
