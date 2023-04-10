# Maintainer: Pellegrino Prevete <pellegrinoprevete [at] gmail [dot] com>
# Contributor: Roberto Valentini <valantin89 [at] gmail [dot] com>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_gemname="mediawiki_api"
pkgname="ruby-${_gemname}"
pkgver=0.7.1
pkgrel=1
pkgdesc="Uses adapter-agnostic Faraday gem to talk to MediaWiki API."
arch=('any')
url="https://rubygems.org/gems/${_gemname}"
license=('MIT')
depends=('ruby-faraday-cookie_jar'
         'ruby-faraday-middleware')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('6bf9f2e381a29a4b9d8e48b7a500fd5bef4e2e706de7dde5e756ed6f2432728e')
noextract=("${_gemname}-${pkgver}.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies \
              --no-user-install \
              --no-document -i "${pkgdir}/${_gemdir}" \
              -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
