# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=unikmer-bin
_pkgname=unikmer
pkgver=0.20.0
pkgrel=1
pkgdesc="Versatile toolkit for nucleotide k-mers with taxonomic information"
arch=('x86_64')
url="https://github.com/shenwei356/unikmer"
license=('MIT')
provides=("unikmer=$pkgver")
conflicts=('unikmer')
options=('!strip' '!debug')
source=(
    "https://github.com/shenwei356/unikmer/releases/download/v${pkgver}/unikmer_linux_amd64.tar.gz"
    "https://raw.githubusercontent.com/shenwei356/unikmer/v${pkgver}/LICENSE"
)
sha256sums=('f6558c7f01c6c3458e52ada9a0fde276f4d4b1a32458f0fdc80760d39928022d'
            '4d549b7a703dfb10d5aaaf80843f741842c13a57b24e5b22488910d5799382d1')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
