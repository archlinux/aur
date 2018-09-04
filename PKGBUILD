# Maintainer: Clever Cloud CI <ci@clever-cloud.com>

pkgname=clever-tools-bin-beta
pkgver=1.0.0-beta.1
pkgrel=1
pkgdesc="Command Line Interface for Clever Cloud."
arch=('x86_64')
url="https://github.com/CleverCloud/clever-tools"
license=('MIT')

options=('!strip')
source=("clever-tools-${pkgver}_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/${pkgver}/clever-tools-${pkgver}_linux.tar.gz")
sha256sums=('dd6c587970023bbfd4973426d201daac347fa73566b5c61e253964f2ad7d36e9')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/clever" "${pkgdir}/usr/lib/${pkgname}/clever"

  "${srcdir}/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
