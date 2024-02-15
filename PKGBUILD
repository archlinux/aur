# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-3.3.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/3.3.0/clever-tools-3.3.0_linux.tar.gz")
sha256sums=('066a5cac17e071bd6292c6b25d5bf8d8bfbafb4825775c0aed72415a7581f571')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-3.3.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-3.3.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-3.3.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
