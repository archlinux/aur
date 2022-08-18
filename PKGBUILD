# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact at fossdaily dot xyz>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: brent s. <bts at square-r00t dot net>
# Contributor: Wes Brown <wesbrown18 at gmail dot com>

_pkgname=dpkt
pkgname="python-${_pkgname}"
pkgver=1.9.8
pkgrel=1
pkgdesc='Fast, simple packet creation / parsing, with definitions for the basic TCP/IP protocols'
arch=('any')
url='https://github.com/kbandla/dpkt'
_url_pypi='https://pypi.org/project/dpkt'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('43f8686e455da5052835fd1eda2689d51de3670aac9799b1b00cfd203927ee45')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
