# Maintainer: danalec
pkgname=rgx-search-v4-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Ripgrep-compatible search inside PDFs, Office documents, archives, 3D models, LLM checkpoints, databases and e-mail (x86-64-v4 / AVX-512 tuned binary release)"
arch=('x86_64')
url="https://github.com/danalec/rgx"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('rgx-search-bin')
conflicts=('rgx-search-bin' 'rgx-search-v2-bin' 'rgx-search-avx2-bin' 'rgx-search-v4-bin' 'rgx-search-znver4-bin')
source=("rgx-v${pkgver}-v4-linux.tar.gz::https://github.com/danalec/rgx/releases/download/rgx-v${pkgver}/rgx-v${pkgver}-v4-linux.tar.gz")
sha256sums=('cb88729d47c2a1175d59404bae298d1b027b4bc01b01d0b97b9611c150c3e259')
options=('!strip')

package() {
    cd "${srcdir}/rgx-v${pkgver}-v4-linux"
    install -Dm755 rgx "${pkgdir}/usr/bin/rgx"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
