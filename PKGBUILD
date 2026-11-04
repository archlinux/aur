# Maintainer: Romain Bertrand <romaintb@noreply.codeberg.org>
pkgname=fgj-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A command-line tool for working with Forgejo instances (including Codeberg.org) (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/romaintb/fgj"
license=('MIT')
provides=('fgj')
conflicts=('fgj')
source=("LICENSE-${pkgver}::https://codeberg.org/romaintb/fgj/raw/tag/v${pkgver}/LICENSE"
        "README-${pkgver}.md::https://codeberg.org/romaintb/fgj/raw/tag/v${pkgver}/README.md")
source_x86_64=("fgj-${pkgver}-x86_64::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_amd64")
source_aarch64=("fgj-${pkgver}-aarch64::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_arm64")
source_armv7h=("fgj-${pkgver}-armv7h::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_arm")
sha256sums=('aa9cc5b4501bafe72ecf5db0e1a01d9e2c740f942ef0e78a638d7329fac1ba90'
            '02c88ba55ef16ed11d34dd992dba58ea129c5639e75651f0f6a03c558f8a99d4')
sha256sums_x86_64=('c3a93f4d95e2333f5ae0a07a5c37ebf30f74d3f014e7c11981c74326ebae88a4')
sha256sums_aarch64=('7adc8a786642748052abda3c5f8cd0a0a4ff482d9c4ef2d8a989226b1eb8c981')
sha256sums_armv7h=('16619fd11f0e0db9a815d8dffbcd59bc0b67459a909709eaee8c1d9a17f461a3')

package() {
  install -Dm755 "fgj-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fgj"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 <("${pkgdir}/usr/bin/fgj" completion bash) "${pkgdir}/usr/share/bash-completion/completions/fgj"
  install -Dm644 <("${pkgdir}/usr/bin/fgj" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/fgj.fish"
  install -Dm644 <("${pkgdir}/usr/bin/fgj" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_fgj"
}
