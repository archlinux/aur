# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Matthew Gamble <git@matthewgamble.net>

_pkgname=surt
pkgname=python-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc='Sort-friendly URI Reordering Transform (SURT)'
arch=('any')
url='https://github.com/internetarchive/surt'
license=('AGPL3')
depends=('python-six' 'python-tldextract')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('24167eb6c01f24f757eef9bca6bf0ec089ec05ad5b6213c3b727a5e58c0c4720')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
}

# vim: ts=2 sw=2 et:
