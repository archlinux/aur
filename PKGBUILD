# Maintainer: Justin Dray <justin@dray.be>

_pkgname=PyDrive
pkgname=python2-pydrive
pkgver=1.0.1
pkgrel=1
pkgdesc="Google Drive API made easy"
arch=('any')
depends=('python2' 'python2-google-api-python-client' 'python2-yaml' 'python2-six' 'python2-uritemplate' 'python2-oauth2client' 'python2-httplib2' 'python2-simplejson' 'python2-pyasn1' 'python2-pyasn1-modules' 'python2-rsa')
makedepends=('python2-setuptools')
url="https://github.com/googledrive/PyDrive"
license=('Apache')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5b644a896ee3c53f4d37907c09e514dcf0bfa1ddb2214d408531b57c5232ac81')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
