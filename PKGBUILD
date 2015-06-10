# Contributor: Liganic <liganic-aur@gmx.net>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>

pkgname=ruby-archive-tar-minitar
_gemname=${pkgname#ruby-}
pkgver=0.5.2
pkgrel=2
pkgdesc="A pure-Ruby library and command-line utility that provides the ability to deal with POSIX tar(1) archive files."
arch=('any')
url="https://rubygems.org/gems/archive-tar-minitar"
license=('GPL2' 'RUBY')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('c8bf480d64cd6be11c0670870dbd760c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
