# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver='1.0.0_alpha5'
_pkgvername="v${pkgver/_/-}"
pkgrel=1
pkgdesc='Feature-rich handmade Meshtastic console client'
arch=('x86_64' 'aarch64')
url='https://github.com/acelot/termtastic'
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')
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
            'aedcc234f1899c327b61cb2a034b60a7f6173402c14ac0073ef10879ca2c49e8')
sha256sums_x86_64=('204da71ba0a8f367cbcf5b81e85681d70e74e4538e98890166eec5b85ec5dcce')
sha256sums_aarch64=('1cbe3d93a151bd4946d9e704ad3e621ce0c5eabfb58160754845eb86faaffc84')

package() {
    install -Dm755 "$srcdir/termtastic" "$pkgdir/usr/bin/termtastic"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
