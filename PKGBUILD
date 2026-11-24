# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=strdust-bin
_pkgname=strdust
pkgver=1.4.2
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
sha256sums=('79e8f28f7eb1dda5040e182bf7a8ebc95c68f2190bfa7ff4bd96353a6fdb5755'
            'dbf91161de2ff4681a888eb7f7e4ba23da1fbf8e3071ff7a011686a9102278b3')

package() {
  install -Dm755 "${srcdir}/STRdust-linux" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
