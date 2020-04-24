# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kyma-bin
pkgver=1.10.0
pkgrel=2
pkgdesc='Simple set of commands to manage a Kyma installation'
arch=('x86_64')
url="https://github.com/kyma-project/cli"
license=('Apache-2.0')
provides=('kyma' 'kyma-cli')
source=("${url}/releases/download/${pkgver}/kyma_Linux_x86_64.tar.gz")
sha256sums=('f8a285c16dc66ecd55da18a931d86ae7d0ac896ce62356f7ffa43981e8adb851')

package() {
  install -Dm755 "${srcdir}"/kyma "${pkgdir}/usr/bin/kyma"
  install -Dm644 "${srcdir}"/LICENCE "${pkgdir}/usr/share/licenses/kyma/LICENSE"
  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" 
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
# vim:set ts=2 sw=2 et: