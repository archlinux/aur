# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=modkit-bin
_pkgname=modkit
pkgver=0.6.4
pkgrel=1
pkgdesc="A bioinformatics tool for working with modified bases in BAM/CRAM files"
arch=('x86_64')
url="https://github.com/nanoporetech/modkit"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=(
  "https://github.com/nanoporetech/modkit/releases/download/v${pkgver}/modkit_v${pkgver}_u16_x86_64.tar.gz"
  "https://raw.githubusercontent.com/nanoporetech/modkit/v${pkgver}/LICENCE.txt"
)
sha256sums=('fb332c691431bd336eb0a81cbca17d2a35caf442ac48277ed3e296c2fe061d80'
            '39cc712a23eead54302ce722e2d0cb6eb73d94ad42f407e7153829a4d5154884')

package() {
  install -Dm755 "${srcdir}"/dist_modkit_v${pkgver}_*/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.txt"
}
