# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname=yubikey-manager-completion
pkgver=0.1.0
pkgrel=1
pkgdesc="bash and zsh completion for ykman"
license=('GPL3')
arch=('any')
depends=('yubikey-manager')
source=()
sha256sums=()

build() {
  _YKMAN_COMPLETE=source ykman > "${srcdir}/ykman-bash-complete.sh" || true
  _YKMAN_COMPLETE=source_zsh ykman > "${srcdir}/ykman-zsh-complete.sh" || true
}

package() {
  install -D -m444 "${srcdir}/ykman-bash-complete.sh" "${pkgdir}/usr/share/bash-completion/completions/ykman"
  install -D -m444 "${srcdir}/ykman-zsh-complete.sh" "${pkgdir}/usr/share/zsh/site-functions/_ykman"
}

# vim:set ts=2 sw=2 sts=2 et
