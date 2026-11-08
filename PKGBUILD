# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
_pkgauthor='acelot'
_pkgname='termtastic'
pkgname="${_pkgname}-bin"
pkgver='1.0.0_beta1'
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
            'b07d123a726a392ce12f021ebf71cf56d34a73260d38f19e716cd05f51756fab')
sha256sums_x86_64=('1a2a920c76cc003f064dee5e44320503ac3ab57fe2e10aa356d85a35c822c664')
sha256sums_aarch64=('c985b0b44867591fc76d7a8344e558ee4c226d63fd023e102794a248bc439d94')

package() {
    install -Dm755 "$srcdir/termtastic" "$pkgdir/usr/bin/termtastic"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
