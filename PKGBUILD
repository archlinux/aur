# Contributor: Roberto Valentini <valantin89 [at] gmail [dot] com>
# Contributor: Greg Sutcliffe <aur@emeraldreverie.org>

_gemname=apipie-bindings
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc='Bindings for API calls that are documented with Apipie. Bindings are generated on the fly.'
arch=(any)
url='http://github.com/Apipie/apipie-bindings'
license=(MIT)
depends=('ruby'
         'ruby-gssapi'
         'ruby-json'
         'ruby-oauth'
         'ruby-rest-client')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('415fb34d467955aa774806ceef531f3a8f6ecd280e42342f569b34774b6ccfad')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
