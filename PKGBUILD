# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cloudflare-utils-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Helpful Cloudflare utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/Cyb3r-Jak3/cloudflare-utils"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/cloudflare-utils_linux_amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/cloudflare-utils_linux_arm64.tar.xz")
sha256sums_x86_64=('f3f1de3ea2aacd532c43bc7b2b8080fc531655cf917ce3b1015c0896b7703d3d')
sha256sums_aarch64=('1b2bddac1ac1ec8e06d08f6a5bf7d86b6b6a8cf4b7900928d70868de9760542e')

package() {
  install -Dm755 "cloudflare-utils" "${pkgdir}/usr/bin/cloudflare-utils"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/cloudflare-utils.bash" "${pkgdir}/usr/share/bash-completion/completions/cloudflare-utils"
  install -Dm644 "completions/cloudflare-utils.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/cloudflare-utils.fish"
  install -Dm644 "completions/cloudflare-utils.zsh" "${pkgdir}/usr/share/zsh/site-functions/_cloudflare-utils"
}
