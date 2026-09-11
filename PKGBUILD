# Maintainer: Infinispan Team <aur@infinispan.org>
pkgname=infinispan-cli-bin
pkgver=16.0.15
pkgrel=1
pkgdesc='Command-line interface for Infinispan data grid'
arch=('x86_64' 'aarch64')
url='https://infinispan.org'
license=('Apache-2.0')
provides=('infinispan-cli')
conflicts=('infinispan-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/infinispan/infinispan/releases/download/${pkgver}/infinispan-cli-${pkgver}-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/infinispan/infinispan/releases/download/${pkgver}/infinispan-cli-${pkgver}-linux-aarch_64.zip")
sha256sums_x86_64=('07aa3c5c7ed32e84804adbf7d9229d80f5c5c77f7cccd6118d5155ad5118225c')
sha256sums_aarch64=('1e55399ff6f8e34b9ee0e0f66b060d09484a8445fd8c78ea0df25aacc007cce4')

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    cd "infinispan-cli-${pkgver}-linux-x86_64"
  else
    cd "infinispan-cli-${pkgver}-linux-aarch_64"
  fi
  install -Dm755 infinispan-cli "${pkgdir}/usr/bin/infinispan-cli"
  install -Dm644 completions/infinispan-cli_complete.bash "${pkgdir}/usr/share/bash-completion/completions/infinispan-cli"
  install -Dm644 completions/infinispan-cli_complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_infinispan-cli"
  install -Dm644 completions/infinispan-cli.fish "${pkgdir}/usr/share/fish/vendor_completions.d/infinispan-cli.fish"
  install -Dm644 completions/infinispan-cli_dynamic_complete.bash "${pkgdir}/usr/share/bash-completion/completions/infinispan-cli-dynamic"
  install -Dm644 completions/infinispan-cli_dynamic_complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_infinispan-cli-dynamic"
  install -Dm644 completions/infinispan-cli_dynamic.fish "${pkgdir}/usr/share/fish/vendor_completions.d/infinispan-cli-dynamic.fish"
}
