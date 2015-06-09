# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=rspec-puppet
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc="Spec tests for your Puppet manifests."
arch=('i686' 'x86_64')
url="http://rspec-puppet.com/"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('1e10cf0c9182470ce5f6db97e113767bc29d3426d6e964627eaea20b9d555d92')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
