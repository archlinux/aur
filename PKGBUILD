# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=2.1.0_beta.4
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.1.0-beta.4_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.1.0-beta.4/clever-tools-2.1.0-beta.4_linux.tar.gz")
sha256sums=('a05412d997481f32be03fc763bfd635c4683426a4d6de3d4e8a4a15e4243e007')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.1.0-beta.4_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.1.0-beta.4_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.1.0-beta.4_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
