# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=python-aigpy
_pkgname=aigpy
pkgver=2021.5.27.1
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
sha256sums=('b5ff8c88df033c619e4e041259eb062b86f12cc82b107200543aca7acc58c8f8'
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
