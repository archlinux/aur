# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=ruby-neovim
_gemname=${pkgname#ruby-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Ruby client for Neovim'
url='https://github.com/alexgenco/neovim-ruby'
arch=('any')
license=('MIT')
depends=('neovim' 'ruby' 'ruby-msgpack>=1.0.0')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('daf9851c1733a5674b0d29c07ac038436686bb75ec4bff00922d7caf9cd4f9e5')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  install -D "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
