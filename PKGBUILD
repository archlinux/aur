# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/edikt-bin

pkgname=edikt-bin
pkgver=0.9.0 # renovate: datasource=github-releases depName=jhheider/edikt versioning=semver-coerced
pkgrel=1
pkgdesc='Lossless, format-preserving editor for configuration files'
arch=('x86_64' 'aarch64')
url='https://github.com/jhheider/edikt'
license=('MIT OR Apache-2.0')
provides=("edikt=${pkgver}")
conflicts=('edikt')
options=('!strip' '!debug')
source=(
  "edikt-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/jhheider/edikt/v${pkgver}/LICENSE-MIT"
  "edikt-${pkgver}-LICENSE-APACHE::https://raw.githubusercontent.com/jhheider/edikt/v${pkgver}/LICENSE-APACHE"
)
source_x86_64=("edikt-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/edikt-linux-x86_64.tar.gz")
source_aarch64=("edikt-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/edikt-linux-aarch64.tar.gz")
sha256sums=('00ec7c3870c5123baf6812024c02736f69d156a3634b1a57cfd754e873148f44'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('8fb238f76c45b7fe282e4c2ed5442dce0dd8a87997f5fb9eb1176edaa5d0dfc9')
sha256sums_aarch64=('b33a57873d464cd9f7c25ada7b95e6a37cd12633bdd6b487820b7722b95082c1')

package() {
  install -Dm755 "${srcdir}/edikt" "${pkgdir}/usr/bin/edikt"
  install -Dm644 "${srcdir}/edikt.1" "${pkgdir}/usr/share/man/man1/edikt.1"
  install -Dm644 "${srcdir}/edikt.bash" "${pkgdir}/usr/share/bash-completion/completions/edikt"
  install -Dm644 "${srcdir}/edikt.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/edikt.fish"
  install -Dm644 "${srcdir}/edikt.zsh" "${pkgdir}/usr/share/zsh/site-functions/_edikt"
  install -Dm644 "${srcdir}/edikt-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/edikt-${pkgver}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
