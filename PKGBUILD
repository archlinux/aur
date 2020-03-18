# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.1.0_beta.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.1.0-beta.1_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.1.0-beta.1/clever-tools-2.1.0-beta.1_linux.tar.gz")
sha256sums=('29d02ffd3ae626702f59ba7a299ecb59fb89779cb7142c4c7a6d7e37c7608158')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.1.0-beta.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.1.0-beta.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.1.0-beta.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
