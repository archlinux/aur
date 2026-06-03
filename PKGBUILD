# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>
pkgname=grok-build-bin
pkgver=0.2.20
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

b2sums_x86_64=('1b62057d21bfc36544bf77be515a2919630d4ab93c4bfb4c01f26ff9236e304298ae2bd100209676492fb1aed86829bc9b28b55ca7aba3b9942bb3669685ca42')
b2sums_aarch64=('604fc9d6976adc8de21345c924eda3e3aceddf8e284ef42a20017e63cb01802454993c69854b0bd9eb33bbc353d8e8c4427cdbcc2bde5408571499a068f2d6c8')

package() {
    install -Dm755 "${srcdir}/grok-${pkgver}-linux-${CARCH}" \
        "${pkgdir}/usr/bin/grok"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
Grok Build is proprietary software owned by xAI.
Use is subject to xAI's Terms of Service: https://x.ai/terms-of-service
LICENSE
}
