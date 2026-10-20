# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/edikt-bin

pkgname=edikt-bin
pkgver=0.8.1 # renovate: datasource=github-releases depName=jhheider/edikt
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
sha256sums_x86_64=('c9609b32596c47443c0849b8215a75c7c5e8e8c0ad707b009a8dd24fcbd88602')
sha256sums_aarch64=('0d1194bda0b91a17fe992d015b26eddf80352213e8312cdae4a46e263dfc6986')

package() {
  install -Dm755 "${srcdir}/edikt" "${pkgdir}/usr/bin/edikt"
  install -Dm644 "${srcdir}/edikt.1" "${pkgdir}/usr/share/man/man1/edikt.1"
  install -Dm644 "${srcdir}/edikt.bash" "${pkgdir}/usr/share/bash-completion/completions/edikt"
  install -Dm644 "${srcdir}/edikt.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/edikt.fish"
  install -Dm644 "${srcdir}/edikt.zsh" "${pkgdir}/usr/share/zsh/site-functions/_edikt"
  install -Dm644 "${srcdir}/edikt-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/edikt-${pkgver}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
