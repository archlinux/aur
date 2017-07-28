# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=ruby-neovim
_gemname=${pkgname#ruby-}
pkgver=0.5.1
pkgrel=1
pkgdesc='Ruby client for Neovim'
url='https://github.com/alexgenco/neovim-ruby'
arch=('any')
license=('MIT')
depends=('neovim' 'ruby' 'ruby-msgpack>=1.0.0')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('973928c992c1252a11c4318a1eb48bfb5ed04787e4d6b9e122948ff0483eb623')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  install -D "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
