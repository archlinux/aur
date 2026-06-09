# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>
pkgname=grok-build-bin
pkgver=0.2.38
pkgrel=1
pkgdesc="Grok Build — xAI's terminal coding agent CLI"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-proprietary')
provides=('grok')
conflicts=('grok')
options=('!strip' '!debug' '!emptydirs')

# 版本指针：curl -fsSL https://x.ai/cli/stable
source_x86_64=("grok-${pkgver}-linux-x86_64::https://storage.googleapis.com/grok-build-public-artifacts/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok-${pkgver}-linux-aarch64::https://storage.googleapis.com/grok-build-public-artifacts/cli/grok-${pkgver}-linux-aarch64")

b2sums_x86_64=('680a4111f623c7282074721d8191da39e8dfe86d90888867987f1d42ca4dbea16bf9a143486b2390e9f3472e0e58a19561bac2ed549a71ac59876310f074ece1')
b2sums_aarch64=('59cd731752a573281baf9d8e8775e7db68949965853eb6408c535cb25cee4fd490d063982befe65295d52d40c08cb871e012bce7e4dd002d0eac7c77faa70c9a')

package() {
    install -Dm755 "${srcdir}/grok-${pkgver}-linux-${CARCH}" \
        "${pkgdir}/usr/bin/grok"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
Grok Build is proprietary software owned by xAI.
Use is subject to xAI's Terms of Service: https://x.ai/terms-of-service
LICENSE
}
