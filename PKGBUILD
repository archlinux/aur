# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldmason-bin
_pkgname=foldmason
_tag=4-dd3c235
pkgver=4_dd3c235
pkgrel=2
pkgdesc="Multiple protein structure alignment at scale"
arch=('x86_64')
url="https://github.com/steineggerlab/foldmason"
license=('GPL-3.0-or-later')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/foldmason-linux-avx2.tar.gz")
sha256sums=('7e6f6bd264defda742882ec167eedaad1185c0a83a32646b1ec83fa6c5b86f05')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step. The release
# tarball bundles LICENSE.md.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
