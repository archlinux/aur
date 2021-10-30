# Contributor: Liganic <liganic-aur@gmx.net>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>

pkgname=ruby-archive-tar-minitar
_gemname=${pkgname#ruby-}
pkgver=0.8
pkgrel=1
pkgdesc="A pure-Ruby library and command-line utility that provides the ability to deal with POSIX tar(1) archive files."
arch=('any')
url="https://rubygems.org/gems/archive-tar-minitar"
license=('GPL2' 'RUBY')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies --no-doc -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
sha512sums=('eabb7b87662753d9a76be240686d57b5430dc1cb9aa3485d912aef9b9f81cdf718af16d22e14da9b1e85050c01070436ebfaac29cf04c52f007410810aaddbc7')
