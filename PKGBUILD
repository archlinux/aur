# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=ruby-semverse
_gemname=semverse
pkgver=2.0.0
pkgrel=1
pkgdesc="An elegant library for representing and comparing SemVer versions and constraints"
arch=('any')
url="https://github.com/berkshelf/semverse"
license=(MIT)
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('2dd45034208075e8c14b6f968c5a08c2')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
