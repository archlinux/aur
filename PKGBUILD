# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>

_archive_name=fonts
_pkgver=2024-03-22
_commit_hash=a029626780dd4af32f15a3e708a5b00528c22f1d
pkgname=powerline-console-fonts
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc="Various powerline patched fonts for the text console"
arch=('any')
url="https://github.com/powerline/fonts"
license=('MIT')
source=(
    "${pkgname}-${_commit_hash}.tar.gz::https://github.com/powerline/fonts/archive/${_commit_hash}.tar.gz"
    "https://raw.githubusercontent.com/powerline/powerline/develop/LICENSE"
)
sha512sums=('f0c717daa852443a51b8e4ed980dc4965154b75c78965e3705ef7f8827c3702e6911ad99c1fcdfe9194ace4d1d2b5de3b35a85d9201220fea8c4ec51d89139b9'
            '65ca72eeab47adb28c6cf9c09e19cf947e37890fd6baab605ce78930290c051841d5a34cdd24902d748442e7db16ee9fa40b87dba809a06deb99a87e6b9d4b39')

package() {
    cd "${_archive_name}-${_commit_hash}"
    find -name "*.psf*" -print0 | xargs -0 install -D -t "${pkgdir}/usr/share/kbd/consolefonts"
    install -D -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}

