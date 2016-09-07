# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=semantic_puppet
pkgname=ruby-$_gemname
pkgver=0.1.4
pkgrel=1
pkgdesc='Library of useful tools for working with Semantic Versions and module dependencies.'
arch=(any)
url='https://github.com/puppetlabs/semantic_puppet'
license=('Apache-2.0')
depends=(ruby ruby-gettext-setup)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6c9236fba9e547b43ac35f700506f5df1975905e98a18821ffc28ded754e41ff')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
