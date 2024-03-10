# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=neovim-tagbar
pkgver=3.1.1
pkgrel=1
pkgdesc='Neovim plugin to browse the tags of the current file and get an overview of its structure'
url='https://majutsushi.github.io/tagbar/'
arch=('any')
license=('custom:vim')
depends=('ctags>=5.5' 'neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/preservim/tagbar/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE")
sha512sums=('bbe9215e742dcafa7e943fadd701cd009580301395fba20600a94ce07270e706014abea600fcab5c1d52fc372a9245b60074ab47274d99676edc436a25103445'
            '01f828e4cf4dee832d2b2976d19163f9e9968089c49a0a33783bd84f3507daf1da0730b12d4dae5bc1edbbf2e419f1ba46adb2347155753c06c94dc30631bf29')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"

  install -d "${_installpath}"
  cp -a -t "$_installpath" autoload doc plugin syntax
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
