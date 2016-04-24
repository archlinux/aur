# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=datecalc
_pyname=datecalc
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple date calculator.'
arch=('any')
url='https://github.com/Kwpolska/datecalc'
license=('BSD')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-dateutil')
options=(!emptydirs)
#source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
# URL changed temporarily due to PyPI making things harder
source=("https://pypi.debian.net/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c5cb17b9e7ecd7002a34774424bc04d6')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
