# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario at finel do li>

_gemname=unf
pkgname=ruby-$_gemname
pkgver=0.1.4
pkgrel=2
pkgdesc='This is a wrapper library to bring Unicode Normalization Form support to Ruby/JRuby.'
arch=('any')
url='https://github.com/knu/ruby-unf'
license=('2-clause BSDL')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('4999517a531f2a955750f8831941891f6158498ec9b6cb1c81ce89388e63022e')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
