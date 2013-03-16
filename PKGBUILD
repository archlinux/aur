# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.6.15
pkgrel=2
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://highline.rubyforge.org/"
license=('GPL2' 'RUBY')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('a1925472c2395c897354e66334891b9347887886181a6e5b6a55a44dfda39cc6')

package() {
  cd "${srcdir}"
  local _gemdir="$(env ruby -rubygems -e 'puts Gem.default_dir')"

  gem install --no-user-install -f -i "${pkgdir}${_gemdir}" --ignore-dependencies ${_gemname}-${pkgver}.gem
}
