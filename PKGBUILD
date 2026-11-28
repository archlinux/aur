# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dot-agent-deck-bin
pkgver=0.51.4
pkgrel=1
pkgdesc="Collector for a terminal dashboard monitoring AI coding agent sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/vfarcic/dot-agent-deck"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vfarcic/dot-agent-deck/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dot-agent-deck-collector-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-dot-agent-deck-collector::${_dl}/dot-agent-deck-collector-linux-arm64"
            "${pkgname}-${pkgver}-aarch64-dot-agent-deck::${_dl}/dot-agent-deck-linux-arm64")
sha256sums=('7b74d2ef93a75652bc4472402a7aaecb2325614228127ecab342c6fcd7d0699e')
sha256sums_x86_64=('2e4add58d102916de3dfedc2d6571e3ccc14fee1e13daab0f0fe6cbce09de069')
sha256sums_aarch64=('5025262062952a816fb865d2a67b715639da302d610c22d6c147cf62698f9ae3'
                    '6785106842226f2253db07a3d5eb21730438dc1c6d5d0a1f196872c4ae500e2a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dot-agent-deck-collector"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
