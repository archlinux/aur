# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-popen4
_gemname=${pkgname#ruby-}
pkgver=0.1.2
pkgrel=1
pkgdesc="A single API across platforms for executing a command in a child process."
arch=('any')
url="https://github.com/shairontoledo/popen4/"
license=('RUBY')
depends=('ruby' 'rubygems' 'ruby-open4' 'ruby-platform')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
sha512sums=('d97524f1c3792c5f922fd5b335dcfcc0f5320496e035458e73307e81480470df49ccbe2b5c80820c2ef7b2b47612bc145e408301458ab4426e1a03daa21d8bd0')
