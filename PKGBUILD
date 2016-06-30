# Maintainer: Joshua Hunt <snark1994@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=ruby-sqlite3
_gemname=sqlite3
pkgver=1.3.11
pkgrel=1
pkgdesc="This module allows Ruby programs to interface with the SQLite3 database engine."
arch=('any')
url="http://github.com/luislavena/sqlite3-ruby"
license=('BSD')
depends=('ruby>=1.8.7' 'rubygems' 'sqlite')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem" "LICENSE")
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('de8ecdcc00a7af0cda98661ed94ce442964b9403b425e95c3ac4544b1f3720a7'
            '6f1c3967cc03fe2935649d23a66e6e4704f6adcfb11863dcbe313a0d5d3a0d47')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" sqlite3-${pkgver}.gem
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
