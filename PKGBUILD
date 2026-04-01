# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for weaveback — bidirectional literate programming toolchain.
# Installs weaveback (combined), weaveback-macro, and weaveback-tangle from
# the pre-built x86_64 tarball on the GitHub release.
#
# Regenerate after each release:
#   python packaging/update_release.py <version>

pkgname=weaveback-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Bidirectional literate programming toolchain (noweb, macros, source tracing)"
url="https://github.com/giannifer7/weaveback"
license=('0BSD' 'MIT' 'Apache-2.0')
arch=('x86_64')
provides=('weaveback')
conflicts=('weaveback' 'weaveback-git')
depends=('gcc-libs' 'glibc')
options=('!debug')
source=("weaveback-x86_64-linux.tar.gz::https://github.com/giannifer7/weaveback/releases/download/v${pkgver}/weaveback-x86_64-linux.tar.gz")
sha256sums=('7b12f8f216458b6e3a21482cf112a65bd0a951f7c0b42519ac66421bb8010f60')

package() {
    install -Dm755 weaveback        -t "${pkgdir}/usr/bin"
    install -Dm755 weaveback-macro  -t "${pkgdir}/usr/bin"
    install -Dm755 weaveback-tangle -t "${pkgdir}/usr/bin"
    install -Dm755 weaveback-docgen -t "${pkgdir}/usr/bin"
}
