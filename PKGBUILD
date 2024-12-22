# Maintainer: envolution
# Contributor: Sumner Evans <sumner.evans98 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=zsh-you-should-use
_plugname=you-should-use
pkgver=1.9.0
pkgrel=2
pkgdesc='ZSH plugin that reminds you to use existing aliases for commands you just typed'
url='https://github.com/MichaelAquilina/zsh-you-should-use'
depends=(zsh ncurses)
arch=('any')
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MichaelAquilina/zsh-you-should-use/archive/${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('6ca0128883ab73d3782f70a6b16c95ed033c2497c3e27d5db0a68c90d8fde4a2')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 "${_plugname}.plugin.zsh" \
    "${pkgdir}/usr/share/zsh/plugins/${pkgname}/${_plugname}.plugin.zsh"
  ln -s "/usr/share/zsh/plugins/${pkgname}/${_plugname}.plugin.zsh" \
    "${pkgdir}/usr/share/zsh/plugins/${pkgname}/${pkgname}.plugin.zsh"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README.rst ${pkgdir}/usr/share/doc/${pkgname}/README.rst
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
# vim:set ts=2 sw=2 et:
