# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-1.0.2_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.2/clever-tools-1.0.2_linux.tar.gz")
sha256sums=('c6fd7dfc25b2e6bcef7a28ac805f33c9c8aaa7dc227b257d5f1274ab1d489d01')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-1.0.2_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-1.0.2_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-1.0.2_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
