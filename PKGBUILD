pkgname=rudo-bin
pkgver=0.3.3
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
sha256sums_x86_64=('e15cd65d98d0bdac8de047ba0f2531d14b11cd1d1377aa379338d5a4f1046c41')
sha256sums_aarch64=('54458df05ce2eba77e172de65e26c9b9037eb0bf072086af8d49db140155372d')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 rudo.service "${pkgdir}/usr/lib/systemd/user/rudo.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
