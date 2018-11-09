# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.1.1_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.1.1/clever-tools-1.1.1_linux.tar.gz")
sha256sums=('e528feac72febd0c57228319935e634840fa938328c471d47fd89789c4697eea')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.1.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.1.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.1.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
