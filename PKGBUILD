pkgname=rudo-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/rudo'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('rudo')
conflicts=('rudo')
options=(!strip)
install='rudo-bin.install'
source_x86_64=("${url}/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rudo-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('0249065a5f656532b0376d6be14b93e168388d0d4f59db70f2ff01d5c0a8ed1d')
sha256sums_aarch64=('584495e71ac171c29ab406c486d968763aa5574025592fa035fdc8f85ee88669')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 rudo.service "${pkgdir}/usr/lib/systemd/user/rudo.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
