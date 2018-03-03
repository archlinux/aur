# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_gemname=swearjar
pkgname="ruby-${_gemname}"
pkgver=1.1.1
pkgrel=1
pkgdesc='Put another nickel in the swearjar. Simple profanity detection with content analysis'
arch=('any')
url='http://github.com/joshbuddy/swearjar'
license=()
depends=('ruby' 'ruby-fuzzyhash')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('f7f9f8a1e2fccd773eaa5048c754112335fa7521474975fe4ce20eecd56e317b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim:set ft=sh ts=2 sw=2 et:
