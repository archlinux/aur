# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-pyroma
_pyname=pyroma
pkgver=1.8.1
pkgrel=1
pkgdesc="Test your project's packaging friendliness"
arch=('any')
url='https://bitbucket.org/regebro/pyroma'
license=('MIT')
depends=('python' 'python-docutils' 'python-setuptools')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d9d471be51bae92619a37d6edfdff89d')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
