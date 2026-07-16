pkgname=rudo-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
options=(!strip)
source=("rudo-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('69b6bbea12bcaef925fe957dab606f4e5c623b6ca462840dc5fc808d72869245')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 rudo.service "${pkgdir}/usr/lib/systemd/user/rudo.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
