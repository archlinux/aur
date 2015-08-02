# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Tocer Deng <tocer.deng@gmail.com>

_pkgname=autopep8
pkgname=python2-autopep8
pkgver=1.2
pkgrel=1
pkgdesc="Automatically formats Python code to conform to the PEP 8 style guide."
arch=('any')
url="http://pypi.python.org/pypi/${_pkgname}"
license=('MIT')
depends=('python2' 'python2-pep8')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('6cfbc826e46e3a4c7fb18b6b784ebfb9')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}"/usr/bin/autopep8{,-python2}
}

# vim:set ts=2 sw=2 et:
