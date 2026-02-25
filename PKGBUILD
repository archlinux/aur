# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=babyshark-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Flows-first PCAP TUI with case files and gorgeous UX'
arch=('x86_64')
url='https://github.com/vignesh07/babyshark'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('babyshark')
conflicts=('babyshark')
optdepends=('wireshark-cli: live packet capture via tshark')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/babyshark-v${pkgver}-linux-x64.tar.gz")
sha256sums=('5cf7425ff352f4588152ec0144585ddef7fe619ba7f3c5a59ca54e995dd02597')

package() {
    install -Dm755 babyshark "${pkgdir}/usr/bin/babyshark"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/vignesh07/babyshark/blob/main/LICENSE
EOF
}
