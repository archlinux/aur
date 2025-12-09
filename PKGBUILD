# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.4.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

OPTIONS=(!strip)

source=("clever-tools-4.4.1_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.4.1/clever-tools-4.4.1_linux.tar.gz")
sha256sums=('97f183fc2c7720241370fff611cd47e204103a65b1327acb166389a965331caa')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.4.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.4.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.4.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}