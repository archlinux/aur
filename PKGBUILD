# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.10.0_beta.2
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.10.0-beta.2_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.10.0-beta.2/clever-tools-2.10.0-beta.2_linux.tar.gz")
sha256sums=('2ca3bc99185d96f48294f2fdd9fa328ddbbbbd62249948c590dc3ed82369e88a')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.10.0-beta.2_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.10.0-beta.2_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.10.0-beta.2_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
