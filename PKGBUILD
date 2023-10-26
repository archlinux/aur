# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=kubectx-bash
_pkgname=kubectx
pkgver=0.9.5
pkgrel=1
pkgdesc='Utility to manage and switch between kubectl contexts and Kubernetes namespaces (bash version)'
url='https://github.com/ahmetb/kubectx'
arch=('any')
license=('Apache')
depends=('bash' 'kubectl')
optdepends=('fzf: interactively choose entries')
provides=('kubectx' 'kubens')
conflicts=('kubectx' 'kubens')
source=("${url}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a7eacc4676d70caba7081aa09f36f8513c3578368a6f0984fd88d3fe674df8cadb3c5ccf109e9ea231bcfd189af6416b94b8e2cb4a4073a9b12c37e88ed73008')
b2sums=('e23ed5ad53abd645577682f5c263db1d62d9b77b688181fe7f2911312f182e18d6a56d063302253d2853a39c5fc832467ea0dd1c18b6ad34d5c99e9535530b6c')

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm 755 -p kubectx kubens -t "${pkgdir}/usr/bin"

  # completion
  install -Dm 644 -p completion/kubectx.bash "${pkgdir}/usr/share/bash-completion/completions/kubectx"
  install -Dm 644 -p completion/kubens.bash "${pkgdir}/usr/share/bash-completion/completions/kubens"
  install -Dm 644 -p completion/_kubectx.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubectx"
  install -Dm 644 -p completion/_kubens.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubens"
  install -Dm 644 -p completion/kubectx.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubectx.fish"
  install -Dm 644 -p completion/kubens.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubens.fish"
}

# vim: ts=2 sw=2 et:
