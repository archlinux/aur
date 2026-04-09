# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.8.0
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=(!strip)

source=("clever-tools-4.8.0_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.8.0/clever-tools-4.8.0_linux.tar.gz")
sha256sums=('8b0e29e5593d2db69f8d55b59f653046a4af7092cf439feacaff27a9739f87bd')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.8.0_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.8.0_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.8.0_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}