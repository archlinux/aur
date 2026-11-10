# Maintainer: danalec
pkgname=rgx-search-avx2-bin
pkgver=0.1.10
pkgrel=2
pkgdesc="Ripgrep-compatible search inside PDFs, Office documents, archives, 3D models, LLM checkpoints, databases and e-mail (AVX2 optimized binary release)"
arch=('x86_64')
url="https://github.com/danalec/rgx"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('rgx-search-bin')
conflicts=('rgx-search-bin' 'rgx-search-v2-bin' 'rgx-search-v4-bin' 'rgx-search-znver4-bin')
source=("rgx-v${pkgver}-avx2-linux.tar.gz::https://github.com/danalec/rgx/releases/download/rgx-v${pkgver}/rgx-v${pkgver}-avx2-linux.tar.gz")
sha256sums=('f1332ba39ccad2b4df3274c5103652798f14c9d085e7ab41ea5a23209028a45e')
options=('!strip')

package() {
    cd "${srcdir}/rgx-v${pkgver}-avx2-linux"
    install -Dm755 rgx "${pkgdir}/usr/bin/rgx"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
