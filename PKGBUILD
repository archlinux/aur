# Maintainer: czyt <czytcn@gmail.com>
pkgname=codiff-bin
_tag="1.20.1"
pkgver=1.20.1
pkgrel=1
pkgdesc="A beautiful, minimal, local diff viewer for reviewing staged and unstaged Git changes before committing"
arch=('x86_64')
url="https://github.com/nkzw-tech/codiff"
license=('MIT')
depends=('gtk3' 'nss' 'at-spi2-core' 'alsa-lib' 'cups' 'mesa' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr')
provides=('codiff')
conflicts=('codiff')
source_x86_64=("codiff_${pkgver}_amd64.deb::https://github.com/nkzw-tech/codiff/releases/download/v${_tag}/codiff_${pkgver}_amd64.deb")
sha256sums_x86_64=('005b017afea42cf0a06e48df6cdd1c48dc79d670992e30a85557d7241a50b616')

package() {
    bsdtar -xOf "${srcdir}/codiff_${pkgver}_amd64.deb" data.tar.zst | bsdtar -xC "${pkgdir}"

    # Remove Debian-specific files
    rm -rf "${pkgdir}/usr/share/lintian" "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
