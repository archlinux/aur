# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-tweepy
pkgname=('python-tweepy' 'python2-tweepy')
_pypiname=tweepy
pkgver=3.4.0
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
sha512sums=('4d4fc25eaf765562810c4b874e6db3c7de892d183df2cc97bd02aa1938e0c2f5a53d8e152ab8481d7669434254126b896bc2eba3e8912d3a313f5b7855e4f576')

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
