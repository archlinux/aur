# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.6.2_beta.2
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.6.2-beta.2_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.6.2-beta.2/clever-tools-2.6.2-beta.2_linux.tar.gz")
sha256sums=('8f2cdde00778cb7a22f14d6c4250286f4c50475150ce374f9024b018dfa22d88')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.6.2-beta.2_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.6.2-beta.2_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.6.2-beta.2_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
