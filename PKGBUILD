# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.0.0_beta.28
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.0.0-beta.28_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.28/clever-tools-1.0.0-beta.28_linux.tar.gz")
sha256sums=('6c4883dce7a5ec8e3ca5189fd4d6040dfd5a85e5bf7868161e2fdeaa225f332d')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.0.0-beta.28_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.0.0-beta.28_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.0.0-beta.28_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
