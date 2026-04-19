# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for weaveback — bidirectional literate programming toolchain.
# Installs the split CLI plus supporting tools from the pre-built x86_64
# tarball on the GitHub release.
#
# Regenerate after each release:
#   python packaging/update_release.py <version>

pkgname=weaveback-bin
pkgver=0.12.5
pkgrel=1
pkgdesc="Bidirectional literate programming toolchain (noweb, macros, source tracing)"
url="https://github.com/giannifer7/weaveback"
license=('0BSD' 'MIT' 'Apache-2.0')
arch=('x86_64')
provides=('weaveback' 'wb-tangle' 'wb-query' 'wb-serve' 'wb-mcp')
conflicts=('weaveback' 'weaveback-git')
depends=('gcc-libs' 'glibc')
options=('!debug')
source=("weaveback-x86_64-linux.tar.gz::https://github.com/giannifer7/weaveback/releases/download/v${pkgver}/weaveback-x86_64-linux.tar.gz")
sha256sums=('fe7698b1ff6fd9c8753ac172de9aa90ff472efb89e08bd770bd8189c0c526e73')

package() {
    install -Dm755 weaveback-macro  -t "${pkgdir}/usr/bin"
    install -Dm755 weaveback-tangle -t "${pkgdir}/usr/bin"
    install -Dm755 weaveback-docgen -t "${pkgdir}/usr/bin"
    install -Dm755 wb-tangle        -t "${pkgdir}/usr/bin"
    install -Dm755 wb-query         -t "${pkgdir}/usr/bin"
    install -Dm755 wb-serve         -t "${pkgdir}/usr/bin"
    install -Dm755 wb-mcp           -t "${pkgdir}/usr/bin"
}
