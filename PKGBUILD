# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>
pkgname=grok-build-bin
pkgver=0.2.16
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

b2sums_x86_64=('fee9082721e40aa4a4da727ca80ae8d487fd598128b1e44b9a62e3370bf9059289c83e16e4acb65abc8d585ad0a2fd66248618c125056a12104ef09653b18590')
b2sums_aarch64=('51b76f42810b4dae6285ef6966436f0c77020923650472fa3526c55783bd2e14d8adb1dfd87645343cc049c9eeaa870deb1dfcab97090786065d5d86ca89bd82')

package() {
    install -Dm755 "${srcdir}/grok-${pkgver}-linux-${CARCH}" \
        "${pkgdir}/usr/bin/grok"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
Grok Build is proprietary software owned by xAI.
Use is subject to xAI's Terms of Service: https://x.ai/terms-of-service
LICENSE
}
