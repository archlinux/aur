# Maintainer: farawayer <farwayer@gmail.com>

_gemname=terminal-notifier
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=2
pkgdesc='Send User Notifications on Mac OS X 10.10 or higher.'
arch=(any)
url='https://github.com/alloy/terminal-notifier'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4246fdd3c36f258e1514ea0f296c4db2becf3726')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
