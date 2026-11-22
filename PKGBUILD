# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=zepp-life
pkgver=0.1.0
pkgrel=1
pkgdesc="Store your Zepp Life data locally and inspect it"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/zepp-life"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/zepp-life/v${pkgver}/LICENSE"
        "THIRD_PARTY_NOTICES.txt::https://github.com/vmvarela/zepp-life/releases/download/v${pkgver}/THIRD_PARTY_NOTICES.txt"
        "zepp-life.1.gz::https://github.com/vmvarela/zepp-life/releases/download/v${pkgver}/zepp-life.1.gz")
sha256sums=('aa0a1ee0bc207810098f0c95dce3cd21e47dca12b9fbd642ddfaff418b199faf' '6eff2772ec2040ea4c85828b4b797e2b181ca682fcc847819e392724660fe143' 'd4f03a5dc3265be628ce647f57e13aa2154e24b0ceba64de46c8be328f571df6')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/zepp-life/releases/download/v${pkgver}/zepp-life-linux-amd64")
sha256sums_x86_64=('bc1b3e16543585ab3437f731c28c6a34a86adb2892f22b530d826694bbb94456')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/zepp-life/releases/download/v${pkgver}/zepp-life-linux-arm64")
sha256sums_aarch64=('ab9da6ccbccdc297de76b508f2b60b990298d550067aafaef25eedb6138f04d9')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICES.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"
    install -Dm644 zepp-life.1.gz "${pkgdir}/usr/share/man/man1/zepp-life.1.gz"
}
