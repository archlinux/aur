# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=puppetlabs_spec_helper
pkgname=ruby-$_gemname
pkgver=0.10.3
pkgrel=1
pkgdesc="A set of shared spec helpers specific to Puppetlabs projects."
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/puppetlabs_spec_helper"
license=('Apache-2.0')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('63a387d3b19246a6305b510674adf4a4847cb54aa13b3343c16a7f6978641361')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
