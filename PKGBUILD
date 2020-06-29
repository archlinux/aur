# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=python-aigpy
_pkgname=aigpy
pkgver=2020.6.29.1
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://github.com/yaronzz/AIGPY"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-colorama'
  'python-mutagen'
)
makedepends=('python-setuptools')
source=(
  "https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/yaronzz/AIGPY/master/LICENSE")
sha256sums=('21ccbf7a3b45d6aee13024d463910be592564fc06bc4caf381f2f7949eb27297'
            '83e4dd21429a91fb7cea67a476032a9641425e5355df2e0f589a738b6ec9fd2c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
