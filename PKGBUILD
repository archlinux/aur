# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sysknife-bin
pkgver=0.30.4
pkgrel=1
pkgdesc="Approval-gated AI administration for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/lacs-project/sysknife"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lacs-project/sysknife/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64-sysknife-daemon-v${pkgver}::${_dl}/sysknife-daemon-v${pkgver}-linux-x86_64"
            "${pkgname}-${pkgver}-x86_64-sysknife-v${pkgver}::${_dl}/sysknife-v${pkgver}-linux-x86_64"
            "${pkgname}-${pkgver}-x86_64-sysknife-v${pkgver}::${_dl}/sysknife-v${pkgver}-linux-x86_64.intoto.jsonl")
source_aarch64=("${pkgname}-${pkgver}-aarch64-sysknife-daemon-v${pkgver}::${_dl}/sysknife-daemon-v${pkgver}-linux-aarch64"
            "${pkgname}-${pkgver}-aarch64-sysknife-v${pkgver}::${_dl}/sysknife-v${pkgver}-linux-aarch64"
            "${pkgname}-${pkgver}-aarch64-sysknife-v${pkgver}::${_dl}/sysknife-v${pkgver}-linux-aarch64.intoto.jsonl")
sha256sums=('1c2ca74f06af306be5d655f7456a0e507482d985ca297f1e3053a14530fb531a')
sha256sums_x86_64=('3204f329ecfe06ec58ed797e362c7b33c56790d4d8d7953e123b5526f5cbc9cd'
                   '939d2e9c4b26cdcea6c5a7f1f9c713543e7e7a54be4d5eaa3269fb4222113f5e'
                   '939d2e9c4b26cdcea6c5a7f1f9c713543e7e7a54be4d5eaa3269fb4222113f5e')
sha256sums_aarch64=('4255a2198a8663162f8e26c03b0a58c94901ec5f42b0961ae4c81ad5cdf7e8d1'
                    '6942b8d035a65cd6d9ed0aa15850596b4f9e5124c159e6caedba4d4eb448e541'
                    '6942b8d035a65cd6d9ed0aa15850596b4f9e5124c159e6caedba4d4eb448e541')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-sysknife-daemon-v${pkgver}" "${pkgdir}/usr/bin/sysknife-daemon"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-sysknife-v${pkgver}" "${pkgdir}/usr/bin/sysknife"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
