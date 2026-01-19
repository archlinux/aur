# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.5.3
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=(!strip)

source=("clever-tools-4.5.3_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.5.3/clever-tools-4.5.3_linux.tar.gz")
sha256sums=('6ae27453efdb4305e134f8f0b13136818b152dd5a5adca2c75d169bdbff48446')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.5.3_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.5.3_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.5.3_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}