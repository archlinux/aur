# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wbsv
pkgver=0.2.5
_pythonhosted_hash='16/f3/eb6816d07b366f8ca31689b6efce14ab9f134498ecb47e9adafb5a882121'
pkgrel=1
pkgdesc='CLI tool for saving webpages to the Wayback Machine'
arch=('any')
url='https://github.com/eggplants/wbsv-cli'
_rawurl='https://raw.githubusercontent.com/eggplants/wbsv-cli'
license=('MIT')
depends=('python-beautifulsoup4' 'python-savepagenow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/${_pythonhosted_hash}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::${_rawurl}/master/LICENSE")
sha256sums=('ea7ea2d89c3ca65d1e6eb264a9620a2bafaefadba5b0c260bef32be456c535ac'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
