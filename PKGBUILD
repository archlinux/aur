# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=puppetlabs_spec_helper
pkgname=ruby-$_gemname
pkgver=2.3.1
pkgrel=1
pkgdesc="A set of shared spec helpers specific to Puppetlabs projects."
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/puppetlabs_spec_helper"
license=('Apache-2.0')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('cfe76b8eb681a23668572cbc817c94ffe50c846cad8a7a7d19ad6f8965d22042')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
