# Maintainer: danalec
pkgname=rgx-search-bin
pkgver=0.1.10
pkgrel=4
pkgdesc="Ripgrep-compatible search inside PDFs, Office documents, archives, 3D models, LLM checkpoints, databases and e-mail (binary release)"
arch=('x86_64')
url="https://github.com/danalec/rgx"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
source=("rgx-v${pkgver}-x86_64-linux-gnu.tar.gz::https://github.com/danalec/rgx/releases/download/rgx-v${pkgver}/rgx-v${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=('a47153015ae6136fb31b4cd57424d84323aad655d93a61c838820a5062ebcd38')
conflicts=('rgx-search-bin' 'rgx-search-v2-bin' 'rgx-search-avx2-bin' 'rgx-search-v4-bin' 'rgx-search-znver4-bin')
options=('!strip')

package() {
    cd "${srcdir}/rgx-v${pkgver}-x86_64-linux-gnu"
    install -Dm755 rgx "${pkgdir}/usr/bin/rgx"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
