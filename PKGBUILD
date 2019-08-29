# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.5.0_beta.14
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.5.0-beta.14_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.5.0-beta.14/clever-tools-1.5.0-beta.14_linux.tar.gz")
sha256sums=('690302761b52cf1d58e617c8ffdbe787af088cb52baef63aa6dcf6b6af05685c')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.5.0-beta.14_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.5.0-beta.14_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.5.0-beta.14_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
