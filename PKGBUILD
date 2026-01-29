# Maintainer: Your Name <your.email@example.com>

pkgname=pomo-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A customizable TUI Pomodoro timer with ASCII art, progress bar, and desktop notifications"
arch=('x86_64')
url="https://github.com/Bahaaio/pomo"
license=('MIT')
depends=('glibc')
optdepends=(
    'libnotify: for desktop notifications'
)
provides=('pomo')
conflicts=('pomo')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bahaaio/pomo/releases/download/v${pkgver}/pomo_Linux_x86_64.tar.gz")
sha256sums_x86_64=('2afc280c05e2f64de10d88505131e31a9fe5315b0986052083b0ff1302f6c87f')

package() {
    install -Dm755 pomo "${pkgdir}/usr/bin/pomo"
    
    # Install license if available in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
