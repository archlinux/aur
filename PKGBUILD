# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.6.3_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/1.6.3/clever-tools-1.6.3_linux.tar.gz")
sha256sums=('8773b0c41c8534b3dccb7aeec0ab3c5b3eb3dc6922c8cbf8338ce073607b955a')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.6.3_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.6.3_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.6.3_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
