# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=strdust-bin
_pkgname=strdust
pkgver=1.0.0
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
sha256sums=('fe9b13d74a7bd4090ed0216d876afb05f6a922b2b378b3ff5536adf9afaa997f'
            'dbf91161de2ff4681a888eb7f7e4ba23da1fbf8e3071ff7a011686a9102278b3')

package() {
  install -Dm755 "${srcdir}/STRdust-linux" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
