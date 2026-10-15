# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=folddisco-bin
_pkgname=folddisco
_tag=3-3e193e3
pkgver=3_3e193e3
pkgrel=1
pkgdesc="Fast indexing and search of discontinuous motifs in protein structures"
arch=('x86_64')
url="https://github.com/steineggerlab/folddisco"
license=('GPL-3.0-or-later')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/folddisco-linux-x86_64.tar.gz")
sha256sums=('72198ea14c9f699d3f1240db21eba58e2c8a68415bbc7554221877ec289db103')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step. The release
# tarball bundles LICENSE.md.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
