# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=python-cli-ui
pkgver="0.7.4"
pkgrel=2
pkgdesc="Build nice user interfaces in the terminal"
url="http://github.com/TankerApp/python-cli-ui"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-unidecode' 'python-tabulate' 'python-setuptools')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/71/76/4772ff1c2c982c3e5cd75f5e01ae575adb979afc3473d267915de39813f4/python-cli-ui-0.7.4.tar.gz')
checkdepends=('python-pytest')
md5sums=('db672da326cab4b3004b24418a6377ae')

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
