# Maintainer: czyt <czytcn@gmail.com>
pkgname=codiff-bin
_tag="1.16.2"
pkgver=1.16.2
pkgrel=1
pkgdesc="A beautiful, minimal, local diff viewer for reviewing staged and unstaged Git changes before committing"
arch=('x86_64')
url="https://github.com/nkzw-tech/codiff"
license=('MIT')
depends=('gtk3' 'nss' 'at-spi2-core' 'alsa-lib' 'cups' 'mesa' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr')
provides=('codiff')
conflicts=('codiff')
source_x86_64=("codiff_${pkgver}_amd64.deb::https://github.com/nkzw-tech/codiff/releases/download/v${_tag}/codiff_${pkgver}_amd64.deb")
sha256sums_x86_64=('40395c6f78dd3cec041baafd58bef5858c7fd8623148967eb5613ab31ed5c686')

package() {
    bsdtar -xOf "${srcdir}/codiff_${pkgver}_amd64.deb" data.tar.zst | bsdtar -xC "${pkgdir}"

    # Remove Debian-specific files
    rm -rf "${pkgdir}/usr/share/lintian" "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
