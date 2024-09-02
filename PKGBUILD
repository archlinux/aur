# Mainteiner: Richard Lees <git zero at bitservices dot io>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>
################################################################################

_gemname=excon

################################################################################

pkgname="ruby-${_gemname}"
pkgver=0.111.0
pkgrel=1
pkgdesc='EXtended http(s) CONnections'
arch=(any)
url="https://github.com/excon/${_gemname}"
license=(MIT)
depends=("ruby")
makedepends=("rubygems")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
options=(!emptydirs)
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('90e017194a5e87946b706273677ffe8b418241f41111ad8b499b8d3644308a2a')

################################################################################

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

################################################################################
