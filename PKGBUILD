# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_gemname=fuzzyhash
pkgname="ruby-${_gemname}"
pkgver=0.0.11
pkgrel=1
pkgdesc='A weird hash with special semantics for regex keys'
arch=('any')
url='http://fuzzyhash.rubyforge.org/'
license=()
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('ed8514e03b5bb15be505908814a060cd28ae4494476559b16953db1ac23a47a5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim:set ft=sh ts=2 sw=2 et:
