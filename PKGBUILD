# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Wes Brown <wesbrown18@gmail.com>

_pkgname='dpkt'
pkgname="python-${_pkgname}"
pkgver=1.9.4
pkgrel=1
pkgdesc='Fast, simple packet creation / parsing, with definitions for the basic TCP/IP protocols'
arch=('any')
url='https://github.com/kbandla/dpkty'
_url_pypi='https://pypi.org/project/dpkt'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f4e579cbaf6e2285ebf3a9e84019459b4367636bac079ba169527e582fca48b4')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
