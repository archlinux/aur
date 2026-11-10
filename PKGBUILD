# Maintainer: danalec
pkgname=rgx-search-v2-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Ripgrep-compatible search inside PDFs, Office documents, archives, 3D models, LLM checkpoints, databases and e-mail (x86-64-v2 tuned binary release)"
arch=('x86_64')
url="https://github.com/danalec/rgx"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('rgx-search-bin')
conflicts=('rgx-search-bin' 'rgx-search-v2-bin' 'rgx-search-avx2-bin' 'rgx-search-v4-bin' 'rgx-search-znver4-bin')
source=("rgx-v${pkgver}-v2-linux.tar.gz::https://github.com/danalec/rgx/releases/download/rgx-v${pkgver}/rgx-v${pkgver}-v2-linux.tar.gz")
sha256sums=('a895e9baabe96858b39759194c2e2f4989b95a05c34a5f20e3bea3512dffba85')
options=('!strip')

package() {
    cd "${srcdir}/rgx-v${pkgver}-v2-linux"
    install -Dm755 rgx "${pkgdir}/usr/bin/rgx"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
