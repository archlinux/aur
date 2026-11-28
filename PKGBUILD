# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tweety-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Integrated terminal for your browser"
arch=('x86_64' 'aarch64')
url="https://github.com/pomdtr/tweety"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tweety-${pkgver}-linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tweety-${pkgver}-linux_arm64.tar.gz")
sha256sums_x86_64=('1527e0d601bee85fd90fa637c044e8266eefadf628af87d511abe38eb2b7550c')
sha256sums_aarch64=('66fba9d1082cf7d2546f62d6aebc1283f2f3b506ee94b3e735c3d543a9257f34')

package() {
  install -Dm755 "tweety" "${pkgdir}/usr/bin/tweety"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/tweety.bash" "${pkgdir}/usr/share/bash-completion/completions/tweety"
  install -Dm644 "completions/tweety.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/tweety.fish"
  install -Dm644 "completions/tweety.zsh" "${pkgdir}/usr/share/zsh/site-functions/_tweety"
}
