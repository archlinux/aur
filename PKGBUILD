# Maintainer: danalec
pkgname=rgy-search-bin
install='rgy-search-bin.install'
pkgver=0.1.10.3
pkgrel=1
pkgdesc="Whole-filesystem name search and content search in one stack (binary release)"
arch=('x86_64')
url="https://github.com/danalec/rgy"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
conflicts=('rgy-search-avx2-bin' 'rgy-search-znver4-bin')
source=("rgy-v${pkgver}-x86_64-linux.tar.gz::https://github.com/danalec/rgy/releases/download/rgy-v${pkgver}/rgy-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('302ba2c06cc396e8391e8da9ad8e4aafe1007c6b277c219c3d6d19b301cb8af3')
options=('!strip')

package() {
    cd "${srcdir}"
    install -Dm755 searchctl "${pkgdir}/usr/bin/searchctl"
    install -Dm755 searchd "${pkgdir}/usr/bin/searchd"
    install -Dm755 rgy-autostart "${pkgdir}/usr/bin/rgy-autostart"
    install -Dm755 rgxy "${pkgdir}/usr/bin/rgxy"
    ln -s searchctl "${pkgdir}/usr/bin/rgy"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 FORMATS.md "${pkgdir}/usr/share/doc/${pkgname}/FORMATS.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
