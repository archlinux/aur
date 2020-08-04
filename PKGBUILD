# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

_pkgname=addict
pkgname=python-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc='A Python Dict whos keys can be set both using attribute and item syntax'
arch=('any')
url='https://github.com/mewwts/addict'
license=('MIT')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f22493f056032f50e4931a82444fcba8ef74c8fc994c5d06aa546a1433c2b8b0')

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
