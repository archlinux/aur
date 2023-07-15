# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>

_archive_name=fonts
_pkgver=2018-11-11
_commit_hash=e80e3eba9091dac0655a0a77472e10f53e754bb0
pkgname=powerline-console-fonts
pkgver="${_pkgver//-/}"
pkgrel=2
pkgdesc="Various powerline patched fonts for the text console"
arch=('any')
url="https://github.com/powerline/fonts"
license=('MIT')
source=(
    "${pkgname}-${_commit_hash}.tar.gz::https://github.com/powerline/fonts/archive/${_commit_hash}.tar.gz"
    "https://raw.githubusercontent.com/powerline/powerline/develop/LICENSE"
)
sha512sums=('39947e2f59883f2631db5a2efdfdc3f110bd3d984da45d094e95729e4e7633ef95f9ff96ede71a7efa5eee96c7d967d2df77c37c9ea44288ee70bbead86fafe0'
            '837073c64e267a322b14ec88915c8583a3dbe4a60fd92e306402a3f0eddb147ff41f9860d257f3d5e32b0ee4db39b299fb3b7bbe59d6e6f102ec778cebe0bda4')

package() {
    cd "${_archive_name}-${_commit_hash}"
    find -name "*.psf*" -print0 | xargs -0 install -D -t "${pkgdir}/usr/share/kbd/consolefonts"
    install -D -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
