# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver='1.0.0_beta5'
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
            '03851042fd499734ef22ce9e68a7f95d1944a91a0b9d14584567ee2d31c650c7')
sha256sums_x86_64=('2a5c531946c3d78ae4415337bbce984e86b42ac355a1bedfd8bf51bbe36d605e')
sha256sums_aarch64=('09e3477a36d3d0b01b5c9c32f8e3f1d0b0a712fd60dcc7466d9a93e89845039f')

package() {
    install -Dm755 "$srcdir/termtastic" "$pkgdir/usr/bin/termtastic"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
