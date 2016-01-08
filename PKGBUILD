# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=unf
pkgname=ruby-$_gemname
pkgver=0.1.4
pkgrel=1
pkgdesc='This is a wrapper library to bring Unicode Normalization Form support to Ruby/JRuby.'
arch=('any')
url='https://github.com/knu/ruby-unf'
license=('2-clause BSDL')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('49a5972ec0b3d091d3b0b2e00113f2f342b9b212f0db855eb30a629637f6d302')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
