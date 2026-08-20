# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldseek-bin
_pkgname=foldseek
_tag=10-941cd33
pkgver=10_941cd33
pkgrel=2
pkgdesc="Fast and sensitive comparison of large protein structure sets"
arch=('x86_64')
url="https://github.com/steineggerlab/foldseek"
license=('GPL-3.0-or-later')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/foldseek-linux-avx2.tar.gz"
        "LICENSE.md::https://raw.githubusercontent.com/steineggerlab/foldseek/${_tag}/LICENSE.md")
sha256sums=('e6a3e3860e76b0b7b858736f627fe680d4d7f0fc7298301d8a92b9f711d74ac7'
            'd62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable),
# so there are no runtime shared-library deps and no build step. The release
# tarball omits the license, so it is fetched from the tagged source instead.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
