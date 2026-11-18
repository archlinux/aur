pkgname=rudo-bin
pkgver=0.4.1
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
sha256sums_x86_64=('42eb8240dbb85f77b390f5fd039fba785e34ed0d0a76f19cb94ab0a29ea3843f')
sha256sums_aarch64=('9b810bd34ccb018e646cf62112556189e1563aebe9310807fa0b97b23bc73daa')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 rudo.service "${pkgdir}/usr/lib/systemd/user/rudo.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
