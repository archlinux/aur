# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.1.1_beta.3
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.1.1-beta.3_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.1.1-beta.3/clever-tools-1.1.1-beta.3_linux.tar.gz")
sha256sums=('4ab29304cdd73dc7096b215f029ba428a2a18771af4aa4e005f6eedaadbf7cd9')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.1.1-beta.3_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.1.1-beta.3_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.1.1-beta.3_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
