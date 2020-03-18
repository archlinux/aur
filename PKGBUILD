# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.1.0_beta.3
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.1.0-beta.3_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.1.0-beta.3/clever-tools-2.1.0-beta.3_linux.tar.gz")
sha256sums=('e960cd5bff420d2cc75495fff1639300fb6eb05270b7a3a2493a4e5ae65562dd')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.1.0-beta.3_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.1.0-beta.3_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.1.0-beta.3_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
