# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=metabuli-bin
_pkgname=metabuli
_tag=1.2.0
pkgver=1.2.0
pkgrel=2
pkgdesc="Specific and sensitive metagenomic classification via joint amino acid and DNA k-mer analysis"
arch=('x86_64')
url="https://github.com/steineggerlab/Metabuli"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/metabuli-linux-avx2.tar.gz")
sha256sums=('9a75736bdb4dfae0a9de8cc41a1bbe8458fbfea85587edf4ba58927613e8236a')

# Unlike the rest of this -bin group, metabuli links dynamically against
# libstdc++/libatomic/libgcc_s (all provided by gcc-libs). The release
# tarball bundles LICENSE.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
