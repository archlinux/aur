# Maintainer: czyt <czytcn@gmail.com>
pkgname=codiff-bin
_tag="1.15.0"
pkgver=1.15.0
pkgrel=1
pkgdesc="A beautiful, minimal, local diff viewer for reviewing staged and unstaged Git changes before committing"
arch=('x86_64')
url="https://github.com/nkzw-tech/codiff"
license=('MIT')
depends=('gtk3' 'nss' 'at-spi2-core' 'alsa-lib' 'cups' 'mesa' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr')
provides=('codiff')
conflicts=('codiff')
source_x86_64=("codiff_${pkgver}_amd64.deb::https://github.com/nkzw-tech/codiff/releases/download/v${_tag}/codiff_${pkgver}_amd64.deb")
sha256sums_x86_64=('e299ed7a11237ff403bb625bb3f7149b5797c84057c477ea9db8c4adb0ac52ab')

package() {
    bsdtar -xOf "${srcdir}/codiff_${pkgver}_amd64.deb" data.tar.zst | bsdtar -xC "${pkgdir}"

    # Remove Debian-specific files
    rm -rf "${pkgdir}/usr/share/lintian" "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
