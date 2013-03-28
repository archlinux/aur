# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.6.16
pkgrel=1
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://highline.rubyforge.org/"
license=('GPL2' 'RUBY')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('f1bf165128a5e93fd76041ba832f3f4d001ceada81700c113bcf676892be2ded')

package() {
  cd "${srcdir}"
  local _gemdir="$(env ruby -rubygems -e 'puts Gem.default_dir')"

  gem install --no-user-install -f -i "${pkgdir}${_gemdir}" --ignore-dependencies ${_gemname}-${pkgver}.gem
}
