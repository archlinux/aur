# Maintainer: Clever Cloud <ci@clever-cloud.com>

pkgname=clever-tools-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('Apache-2.0')

OPTIONS=(!strip)

source=("clever-tools-4.0.2_linux.tar.gz::https://clever-tools.clever-cloud.com/releases/4.0.2/clever-tools-4.0.2_linux.tar.gz")
sha256sums=('17acd4b81df3fa905ab18a6c92ab9a1c7914812c7c9d1db8934325fd072e86f2')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever-tools-4.0.2_linux/clever" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever-tools-4.0.2_linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever-tools-4.0.2_linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}