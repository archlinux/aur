# Maintainer: Infinispan Team <aur@infinispan.org>
pkgname=infinispan-cli-bin
pkgver=16.2.1
pkgrel=1
pkgdesc='Command-line interface for Infinispan data grid'
arch=('x86_64' 'aarch64')
url='https://infinispan.org'
license=('Apache-2.0')
provides=('infinispan-cli')
conflicts=('infinispan-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/infinispan/infinispan/releases/download/${pkgver}/infinispan-cli-${pkgver}-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/infinispan/infinispan/releases/download/${pkgver}/infinispan-cli-${pkgver}-linux-aarch_64.zip")
sha256sums_x86_64=('1afe341e7fd0eaa2b84542ed4127d28c5f59542c5e5dba80393c53260a3cf090')
sha256sums_aarch64=('08496d1990191d82b37df01e0ddf5b4057d16a07e8d8cca73bce5ed89885f2d6')

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
