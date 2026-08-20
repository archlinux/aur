# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=folddisco-bin
_pkgname=folddisco
_tag=2-9375a2d
pkgver=2_9375a2d
pkgrel=2
pkgdesc="Fast indexing and search of discontinuous motifs in protein structures"
arch=('x86_64')
url="https://github.com/steineggerlab/folddisco"
license=('GPL-3.0-or-later')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/folddisco-linux-x86_64.tar.gz")
sha256sums=('136517ea298bdf47293518732c534b072b5bc4eed618b376066b595bb2fadfca')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step. The release
# tarball bundles LICENSE.md.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
