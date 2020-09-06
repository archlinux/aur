# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='oyaml'
pkgname="python-${_pkgname}"
pkgver=1.0
pkgrel=1
pkgdesc='Ordered YAML: drop-in replacement for PyYAML which preserves dict ordering'
arch=('any')
url='https://github.com/wimglenn/oyaml'
license=('MIT')
depends=('python' 'python-pyaml')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ed8fc096811f4763e1907dce29c35895d6d5936c4d0400fe843a91133d4744ed')

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
