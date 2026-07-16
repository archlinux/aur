pkgname=rudo-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
options=(!strip)
install='rudo-bin.install'
source=("rudo-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('7e24b8b3e04c4dde97114ad99777d2a259911a7658c8b4d53e2fb1e223d40b34')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 rudo.service "${pkgdir}/usr/lib/systemd/user/rudo.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
