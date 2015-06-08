# Maintainer: Niels Abspoel <aboe76 (at) Gmail.com>

_gemname=pg
pkgname=ruby-pg
pkgver=0.18.1
pkgrel=1
pkgdesc="Pg is the Ruby interface to the Postgresql RDBMS"
arch=("any")
url="https://bitbucket.org/ged/ruby-pg"
license=("GPL")
depends=("ruby")
makedepends=("rubygems" "postgresql-libs")
conflicts=("")
options=(!emptydirs)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
md5sums=('bc21aeb047b159ef68de2a84061e7f80')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  
}
