# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=strdust-bin
_pkgname=strdust
pkgver=1.4.1
pkgrel=1
pkgdesc="Tandem repeat genotyper for long reads"
arch=('x86_64')
url="https://github.com/wdecoster/STRdust"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=(
  "https://github.com/wdecoster/STRdust/releases/download/v${pkgver}/STRdust-linux"
  "https://raw.githubusercontent.com/wdecoster/STRdust/v${pkgver}/LICENSE"
)
sha256sums=('fecca7083594a1b84d1373ee2d2df1ebea1cb246077771d2ce03356ec7dd7bc0'
            '5e5e14f46e2a6dff0a8ad39f2ef48fc8c0a0535ff6c141393a2a4ed465e2abb3')

package() {
  install -Dm755 "${srcdir}/STRdust-linux" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
