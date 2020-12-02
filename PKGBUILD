# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname='yeecli'
pkgver=0.2.0
pkgrel=2
pkgdesc='Command-line utility for controlling the YeeLight RGB LED lightbulb'
arch=('any')
url='https://gitlab.com/stavros/yeecli'
_url_pypi='https://pypi.org/project/yeecli'
license=('BSD')
depends=('python-click' 'python-ifaddr' 'python-yeelight')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a534273ac7997f7e3991d22153e8d17efc87d2e9ee99e6bb4acb8097206d585')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
