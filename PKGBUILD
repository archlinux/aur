# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.4.2_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.4.2/clever-tools-1.4.2_linux.tar.gz")
sha256sums=('2c95533ee0e749d4407c95b513b229664f51a543f1f887ea8cb03c23ca3f1820')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.4.2_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.4.2_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.4.2_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
