# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.6.11
pkgrel=2
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://highline.rubyforge.org/"
license=('GPL2' 'RUBY')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('6ee965dc6793221c216eb18fad73b647d08c6963fbcf716cf10d4569bc822c60')

package() {
  cd "${srcdir}"
  local _gemdir="$(env ruby -rubygems -e 'puts Gem.default_dir')"

  gem install --no-user-install -f -i "${pkgdir}${_gemdir}" --ignore-dependencies ${_gemname}-${pkgver}.gem
}
