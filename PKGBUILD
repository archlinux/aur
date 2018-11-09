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
sha256sums=('c5ca444cfd8e9441fc0285ded8c3aa4478827adede937818e481ed1f41e4dcf5')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.1.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.1.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.1.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
