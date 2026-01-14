# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

OPTIONS=(!strip)

source=("clever-tools-4.5.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.5.0/clever-tools-4.5.0_linux.tar.gz")
sha256sums=('3899956d1322fa690f8ceaab2d2f28217e0a72d594bf53a5961ed4eeed58b21e')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.5.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.5.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.5.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}