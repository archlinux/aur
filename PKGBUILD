# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=hammer_cli
pkgname=ruby-${_gemname/_/-}
pkgver=0.11.0
pkgrel=1
pkgdesc='Hammer cli provides universal extendable CLI interface for ruby apps'
arch=(i686 x86_64)
url='http://github.com/theforeman/hammer-cli'
license=(GPLv3)
depends=('ruby'
         'ruby-apipie-bindings>=0.2.0'
         'ruby-awesome_print'
         'ruby-clamp>1.0'
         'ruby-fast_gettext'
         'ruby-highline'
         'ruby-locale>=2.0.6'
         'ruby-logging'
         'ruby-unicode-display_width')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('93c666a13301cd99f97556498605194cc7f4563040690b444abd595d194c8db0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
