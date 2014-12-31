# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-pyroma
_pyname=pyroma
pkgver=1.7
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url='https://bitbucket.org/regebro/pyroma'
license=('MIT')
depends=('python' 'python-docutils')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.zip")
md5sums=('436b1401c5d4a9c7d307336128ccfd30')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
