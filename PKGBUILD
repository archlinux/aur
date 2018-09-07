# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.0.0_beta.13
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud"
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.0.0-beta.13_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.13/clever-tools-1.0.0-beta.13_linux.tar.gz")
sha256sums=('a3d4f9b1ada9072c43386328338369807ba98ebaa4bceeb34ecc090021fe2094')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
