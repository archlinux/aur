# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

options=('!strip')
source=("clever-tools-2.2.1_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/2.2.1/clever-tools-2.2.1_linux.tar.gz")
sha256sums=('82d4a3d6167a64e5557dbaaf9c55686087db32c06c1776c9196b4dc5e6ccd7ae')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-2.2.1_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-2.2.1_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-2.2.1_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
