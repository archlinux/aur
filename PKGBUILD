# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=sinkzone-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='DNS blocking tool for productivity, focus and child safety'
arch=('x86_64' 'aarch64')
url='https://github.com/berbyte/sinkzone'
license=('MIT')
provides=('sinkzone')
conflicts=('sinkzone')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/sinkzone-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/sinkzone-linux-arm64")
sha256sums_x86_64=('b568b0201c45c8e8d27b4d161f4fa6f4ae668010ba2beadbbbdd603e27f43320')
sha256sums_aarch64=('ef65f7f785d99d5ffecf5f586293effe29d389bac75d454a97b0fbd07bd4a650')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sinkzone"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/berbyte/sinkzone/blob/main/LICENSE
EOF
}
