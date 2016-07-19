# Maintainer: Florian Walch <florian@fwalch.com>

pkgname=ruby-neovim
_gemname=${pkgname#ruby-}
pkgver=0.2.2
pkgrel=1
pkgdesc='Ruby client for Neovim'
url='https://github.com/alexgenco/neovim-ruby'
arch=('any')
license=('MIT')
depends=('neovim' 'ruby' 'ruby-msgpack>=1.0.0')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('3abff2ae18002236e79c31a5ed9c1fe9d472bafa971d9362b76d006ba3a43873')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  install -D "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
