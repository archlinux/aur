# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='wimpy'
pkgname="python-${_pkgname}"
pkgver=0.6
pkgrel=1
pkgdesc='Anti-copy-pasta'
arch=('any')
url='https://github.com/wimglenn/wimpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('014d21a31980eab48b92c4210e9fdba643b79f7081c64ea9bc97f2be9db9bd58')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
