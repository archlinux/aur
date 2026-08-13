# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=strdust-bin
_pkgname=strdust
pkgver=0.20.0
pkgrel=1
pkgdesc="A tandem repeat genotyper for long reads"
arch=('x86_64')
url="https://github.com/wdecoster/STRdust"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=(
  "https://github.com/wdecoster/STRdust/releases/download/v${pkgver}/STRdust-linux"
  "https://raw.githubusercontent.com/wdecoster/STRdust/v${pkgver}/LICENSE"
)
sha256sums=('0a21b228cc93b1a9a5823a5b5a5ce98c4dbe4fbf633dffb03b5f804bf4317c8c'
            'dbf91161de2ff4681a888eb7f7e4ba23da1fbf8e3071ff7a011686a9102278b3')

package() {
  install -Dm755 "${srcdir}/STRdust-linux" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
