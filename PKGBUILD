# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=babyshark-bin
pkgver=0.2.1
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
sha256sums=('1b2ec407880e4b236306d70a6c197c6f961dd2def964e44c5fc97dcd0e6e1530')

package() {
    install -Dm755 babyshark "${pkgdir}/usr/bin/babyshark"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/vignesh07/babyshark/blob/main/LICENSE
EOF
}
