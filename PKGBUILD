# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.0.1_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.1/clever-tools-1.0.1_linux.tar.gz")
sha256sums=('30f2d0703be88faa6db0cd24156a54f2c2a0a405e6a19b26e08a2ab351b95ad0')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.0.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.0.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.0.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
