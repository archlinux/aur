# Mainteiner: Richard Lees <git zero at bitservices dot io>
###############################################################################

_gemname=docker-api

###############################################################################

pkgname="ruby-${_gemname}"
pkgver=2.3.0
pkgrel=2
pkgdesc='A simple REST client for the Docker Remote API.'
arch=(any)
url="https://github.com/upserve/${_gemname}"
license=(MIT)
depends=("ruby" "ruby-excon" "ruby-multi_json")
makedepends=("rubygems")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
options=(!emptydirs)
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('228b53b88e4811fe182c158100730409b468a27ec220ebd0d61e18b218a07e75')

###############################################################################

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

###############################################################################

