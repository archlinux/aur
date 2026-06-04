# Maintainer: Eric Lee <well dot dragonfly dot aaww at mask dot me>
pkgname=grok-build-bin
pkgver=0.2.22
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

b2sums_x86_64=('19f6eb8708816e6ef74b549552e247970d86b7d8bf85f49f70dbec7828fcd4016370aac3c3b0ec887edaeb471a3c987da806a92cf4620e63bd50dec244aa3768')
b2sums_aarch64=('b6f7c082e3c14e617f9be795cb863abba9c684be5ea6424c50b8f533e7b672a6f158a7a8b94e20bbad632c58a21eac5098f2c28f3f992b93e5981534ad7cfcd5')

package() {
    install -Dm755 "${srcdir}/grok-${pkgver}-linux-${CARCH}" \
        "${pkgdir}/usr/bin/grok"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
Grok Build is proprietary software owned by xAI.
Use is subject to xAI's Terms of Service: https://x.ai/terms-of-service
LICENSE
}
