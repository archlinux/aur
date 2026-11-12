# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver='1.0.0_beta4'
_pkgvername="v${pkgver/_/-}"
pkgrel=1
pkgdesc='Feature-rich handmade Meshtastic console client'
arch=('x86_64' 'aarch64')
url='https://github.com/acelot/termtastic'
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-only')
depends=('gcc-libs')
optdepends=()
provides=('termtastic')
conflicts=('termtastic')

source=(
    "LICENSE::${_urlraw}/LICENSE"
    "README.md::${_urlraw}/README.md"
)

source_x86_64=(
    "https://github.com/${_pkgauthor}/${_pkgname}/releases/download/${_pkgvername}/termtastic-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
    "https://github.com/${_pkgauthor}/${_pkgname}/releases/download/${_pkgvername}/termtastic-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums=('3ffa9a413dd0013d4d0cb81d16ba51a5caa51b31708b9d5ad2dd10a4d4e534ed'
            '4076703c60f2febcf99415df241eb38c9262201bb6e40b56552d26d7f2bb278e')
sha256sums_x86_64=('0d0b207809d050a22a0b3f6bf32eb11b004b80e3db1612e5a062b40e129fdddb')
sha256sums_aarch64=('3af86f63e6c9e0c7bfd1691e5d6bf3ed4229e292454c191467a58bd11ee5f8cb')

package() {
    install -Dm755 "$srcdir/termtastic" "$pkgdir/usr/bin/termtastic"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
