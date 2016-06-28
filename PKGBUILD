# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='backbone_extensions'
pkgname="ruby-${_gemname_}"
pkgver='0.0.26'
pkgrel=1
pkgdesc='Adds extensions to the backbone javascript library'
arch=('any')
url='http://github.com/rdy/underscore_extensions'
license=('unknown')
depends=('ruby' 'backbonejs' 'ruby-rails')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('8b499702d500cd05889b47265aa8937ea7a094923b855ae3a69e122581493fd0')


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
