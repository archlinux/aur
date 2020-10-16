# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

_pkgname='pscript'
pkgname="python-${_pkgname}"
pkgver=0.7.4
pkgrel=1
pkgdesc='Python to JavaScript compiler'
arch=('any')
url='https://github.com/flexxui/pscript'
_url_pypi='https://pypi.org/project/pscript'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4cca30461bdcbefcb205a24dfb16ea764f43fc9d7ed06956dc01180cea9fe7ac')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
