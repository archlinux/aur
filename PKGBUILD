# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.5.0_beta.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.5.0-beta.0_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.5.0-beta.0/clever-tools-1.5.0-beta.0_linux.tar.gz")
sha256sums=('257422eddd07d4572506aa66598b6904363c8208ca59cb2ab9aa3cf47aa034fe')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.5.0-beta.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.5.0-beta.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.5.0-beta.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
