# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=python-cli-ui
pkgver="0.9.1"
pkgrel=2
pkgdesc="Build nice user interfaces in the terminal"
url="http://github.com/TankerHQ/python-cli-ui"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-unidecode' 'python-tabulate' 'python-setuptools')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/30/80/84a7184cbdb5473abb102d6bd4395af9f1260e5f6c558d45e68e2c92752d/cli-ui-0.9.1.tar.gz')
checkdepends=('python-pytest')
md5sums=('fcb8a6243bb7bb72e3a186bfeb0b35f9')

build() {
  cd ${srcdir}/cli-ui-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/cli-ui-${pkgver}
  pytest
}

package() {
  cd ${srcdir}/cli-ui-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/python-cli-ui
  install LICENSE $pkgdir/usr/share/licenses/python-cli-ui/LICENSE
}

# vim:set ts=2 sw=2 et:
