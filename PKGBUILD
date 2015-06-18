# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=python2-tweepy
_pypiname=tweepy
pkgver=3.3.0
pkgrel=2
pkgdesc="A Python library for accessing the entire Twitter API"
url="http://www.tweepy.org"
arch=('any')
license=('MIT')
depends=('python2-requests' 'python2-requests-oauthlib' 'python2-six')
makedepends=('python2-setuptools' 'python2-pip')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/${_pypiname}/${_pypiname}/archive/v${pkgver}.tar.gz)
sha512sums=('f88cfc6abc95295930947ca4cd86717bac93b1a2b976048e7c9c606da314ca953d849b176f27f46ca4f46db6165d0dbdb45858921bcdab3f3afcd18fcf2bdc40')

build() {
  cd ${_pypiname}-${pkgver}
  python2 setup.py build
}

package() {
  cd "${_pypiname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
