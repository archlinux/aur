# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=carafe
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Tiny management tool for wine bottles/carafes"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('python' 'wine')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.any.pacman")
sha512sums=('d65ed8b3121c2856c14c93f173b54b405e7a765cb8c01d34688d5dbe8d08398580ddafcda68270689be48c83a2f970dcc2aba0b8904227562cda372253f3faac'
            '430fbccd0ce479eb846b6f7e8d3ecbdbdbb5f03a41e94f427fc9b672073ce4132c0f3b4a139f835f2447e2376a32554084f56fc5de91938ddab339cd306112f7')
sha512sums_x86_64=('7a7321a9a630b37f43d3ea9925eb6beea49af7604f8ccd5f34f94459384fde66f1c07d697e3a5144aa7191006d997d2e81140c79897b5dc94f6b53b73ae38815')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
