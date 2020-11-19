# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kyma-bin
pkgver=1.15.1
pkgrel=1
pkgdesc='Simple set of commands to manage a Kyma installation'
arch=('x86_64')
url="https://github.com/kyma-project/cli"
license=('Apache')
provides=('kyma' 'kyma-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/kyma_Linux_x86_64.tar.gz")
sha256sums=('2c7bea87ea146cc611e4f66da74e1877d8bdc3f941c8067df5e80342a3aad195')

package() {
  install -Dm755 "${srcdir}"/kyma "${pkgdir}/usr/bin/kyma"
  # Populate bash and zsh completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions" 
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
# vim:set ts=2 sw=2 et:
