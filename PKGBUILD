# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aurl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Turn any OpenAPI, Swagger or GraphQL API into a CLI command"
arch=('x86_64' 'aarch64')
url="https://github.com/ShawnPana/aurl"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aurl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aurl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('96a9308dcede9183d2b22566684ca1cb821fe1e1ea2345a2e8f87b871afc09fd')
sha256sums_aarch64=('8745dd349db666e0b18e28a977916e27fe0fac0fd4b99d82278561d05c5334f4')

package() {
  install -Dm755 "aurl" "${pkgdir}/usr/bin/aurl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "docs/completions/aurl.bash" "${pkgdir}/usr/share/bash-completion/completions/aurl"
  install -Dm644 "docs/completions/aurl.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aurl.fish"
  install -Dm644 "docs/completions/aurl.zsh" "${pkgdir}/usr/share/zsh/site-functions/_aurl"
  install -Dm644 "docs/aurl.1" -t "${pkgdir}/usr/share/man/man1"
}
