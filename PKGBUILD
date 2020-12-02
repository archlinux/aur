# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='wimpy'
pkgname="python-${_pkgname}"
pkgver=0.6
pkgrel=2
pkgdesc='Anti-copy-pasta'
arch=('any')
url='https://github.com/wimglenn/wimpy'
_url_pypi='https://pypi.org/project/wimpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('014d21a31980eab48b92c4210e9fdba643b79f7081c64ea9bc97f2be9db9bd58')

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
