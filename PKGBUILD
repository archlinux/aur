# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_gemname=swearjar
pkgname="ruby-${_gemname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Put another nickel in the swearjar. Simple profanity detection with content analysis'
arch=('any')
url='http://github.com/joshbuddy/swearjar'
license=()
depends=('ruby' 'ruby-fuzzyhash')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('beb27c7532af0a9106e63877e4f89ab968f496183161e2b50c42843e28947d34')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim:set ft=sh ts=2 sw=2 et:
