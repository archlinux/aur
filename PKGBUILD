# Maintainer: czyt <czytcn@gmail.com>
pkgname=codiff-bin
_tag="1.4.0"
pkgver=1.4.0
pkgrel=1
pkgdesc="A beautiful, minimal, local diff viewer for reviewing staged and unstaged Git changes before committing"
arch=('x86_64')
url="https://github.com/nkzw-tech/codiff"
license=('MIT')
depends=('gtk3' 'nss' 'at-spi2-core' 'alsa-lib' 'cups' 'mesa' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr')
provides=('codiff')
conflicts=('codiff')
source_x86_64=("codiff_${pkgver}_amd64.deb::https://github.com/nkzw-tech/codiff/releases/download/v${_tag}/codiff_${pkgver}_amd64.deb")
sha256sums_x86_64=('60b2ac758e7c313be69bc030ad18caf91615235d3014ffd72101c6c123c2052c')

package() {
    bsdtar -xOf "${srcdir}/codiff_${pkgver}_amd64.deb" data.tar.zst | bsdtar -xC "${pkgdir}"

    # Remove Debian-specific files
    rm -rf "${pkgdir}/usr/share/lintian" "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
