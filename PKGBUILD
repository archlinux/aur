# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.0.0_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0/clever-tools-1.0.0_linux.tar.gz")
sha256sums=('4dadb226a8a96488d2b3413d8cd480c2b14d296366f96cb20f22be81c25d5270')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.0.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.0.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.0.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
