# Maintainer: farawayer <farwayer@gmail.com>

_gemname=terminal-notifier
pkgname=ruby-$_gemname-1
pkgver=1.8.0
pkgrel=2
pkgdesc='Send User Notifications on Mac OS X 10.10 or higher.'
arch=(any)
url='https://github.com/alloy/terminal-notifier'
license=(MIT)
provides=('ruby-terminal-notifier=1')
conflicts=('ruby-terminal-notifier')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('6189c0cde3bfc7de547bb622b30c69f7941f9403')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
