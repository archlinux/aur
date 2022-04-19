# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=pandoc-ruby
pkgname=ruby-pandoc-ruby
pkgver=2.1.6
pkgrel=0
pkgdesc='Ruby wrapper for Pandoc'
arch=(any)
url='https://github.com/xwmx/pandoc-ruby'
license=(GPL-3.0)
depends=(ruby pandoc ruby-minitest ruby-mocha ruby-rake
    ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4d6808913bbbbfa0466e51c6f13c067b5d50eec5bfd537348ff43ffc1e475a9f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
