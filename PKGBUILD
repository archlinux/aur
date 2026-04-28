# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=(!strip)

source=("clever-tools-4.9.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.9.0/clever-tools-4.9.0_linux.tar.gz")
sha256sums=('a45b9cf65a55097b829f5c7d0bae0caba294b62e5e4800c0971b3b2ca9c2edf9')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.9.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.9.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.9.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}