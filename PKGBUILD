# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=puppet_forge
pkgname=ruby-$_gemname
pkgver=2.2.2
pkgrel=1
pkgdesc='Ruby client for the Puppet Forge API.'
arch=(any)
url='https://github.com/puppetlabs/forge-ruby'
license=('Apache-2.0')
depends=(ruby ruby-faraday ruby-faraday_middleware ruby-semantic_puppet ruby-minitar ruby-gettext-setup)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9ba3c47bccdf97ce511f916b627b3902e02a1913951598b2887437025abc56d4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
