# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=datecalc
_pyname=datecalc
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple date calculator.'
arch=('any')
url='https://github.com/Kwpolska/datecalc'
license=('BSD')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-dateutil')
options=(!emptydirs)
# Temporary URL until PyPI sorts their nonsense out
source=("http://pypi.debian.net/datecalc/datecalc-0.1.0.tar.gz")
md5sums=('6595b77472431152ea4ce581b954acaa')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
