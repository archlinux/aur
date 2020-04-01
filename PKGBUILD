# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.3.1_beta.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.3.1-beta.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.3.1-beta.0/clever-tools-2.3.1-beta.0_linux.tar.gz")
sha256sums=('2358f30623aea42129c749480d6520f49ad5b7b85edeb6147c33aeb7e39a7616')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.3.1-beta.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.3.1-beta.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.3.1-beta.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
