# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.4.1_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.4.1/clever-tools-1.4.1_linux.tar.gz")
sha256sums=('d2f0d47c8ecb97d45993bfd86b25ecbc30ae9a4f5a5684e3cc583a949a79cc61')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.4.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.4.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.4.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
