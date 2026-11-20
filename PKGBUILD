# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver='1.0.0_beta11'
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
            '9207e3ee951dcf6d0c4f0bd4b6e1b53304981b3481e4ad81bc6b85a03a8e21c7')
sha256sums_x86_64=('e50643ad884ba2d99fcdbaad6782c5c7a2ccba9e862493503fe4fb4c6be0549a')
sha256sums_aarch64=('8dae0ff5e2d1dca4141c605039c5261a797d1499d814dfb79c4a7791e66083fc')

package() {
    install -Dm755 "$srcdir/termtastic" "$pkgdir/usr/bin/termtastic"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
