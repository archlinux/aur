# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.5.1_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/1.5.1/clever-tools-1.5.1_linux.tar.gz")
sha256sums=('6a2cb264dfe3d1e88187de05a9a7aeb8ca4bf590f792b0e40df3b9bf5f0fcde7')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.5.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.5.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.5.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
