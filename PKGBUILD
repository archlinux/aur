# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-tweepy
pkgname=('python-tweepy' 'python2-tweepy')
_pypiname=tweepy
pkgver=3.5.0
pkgrel=1
pkgdesc="A Python library for accessing the entire Twitter API"
url="http://www.tweepy.org"
arch=('any')
license=('MIT')
makedepends=(
  'python-setuptools' 'python-pip' 'python2-setuptools' 'python2-pip'
  'python-requests' 'python-requests-oauthlib' 'python-six'
  'python2-requests' 'python2-requests-oauthlib' 'python2-six'
)
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/${_pypiname}/${_pypiname}/archive/v${pkgver}.tar.gz)
sha512sums=('02e87baa2433e4bfbe5623244e8684da8015f44f30c00f52285fd5b94a53095c6255e07d11002418f4de6d9161ef9be490d6f934ca0c79dd476fc9c5fbcf5a88')

package_python-tweepy() {
  depends=('python-requests' 'python-requests-oauthlib' 'python-six')

  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-tweepy() {
  depends=('python2-requests' 'python2-requests-oauthlib' 'python2-six')

  cd ${_pypiname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
