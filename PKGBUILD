# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

_pkgname='addict'
pkgname="python-${_pkgname}"
pkgver=2.3.0
pkgrel=1
pkgdesc='A Python Dict whos keys can be set both using attribute and item syntax'
arch=('any')
url='https://github.com/mewwts/addict'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e8085624d18a9eecd7ec8a427f378f1e5036dfafba34c33fa29f0be8cd3a80b2')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
