# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=pyenvinfo
pkgname=python-${_pkgname}
pkgver=0.0.1
pkgrel=1
pkgdesc='Python Library to get execution environment information'
arch=('any')
url='https://github.com/thombashi/pyenvinfo'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5e541a1c083c34ce00258dfccb38b5e8a9a2120fca9b164e5bbcc314d54091c5')

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
