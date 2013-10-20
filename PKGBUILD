# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.6.20
pkgrel=1
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://rubygems.org/gems/highline"
license=('GPL2' 'RUBY')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('3b22f05b871e9e8963df2c67bfb40310dbc5410260419237309b962cf8ad673e')

package() {
  cd "${srcdir}"
  local _gemdir="$(env ruby -rubygems -e 'puts Gem.default_dir')"

  gem install --no-user-install -f -i "${pkgdir}${_gemdir}" --ignore-dependencies ${_gemname}-${pkgver}.gem
}
