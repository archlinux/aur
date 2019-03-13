# Maintainer: farawayer <farwayer@gmail.com>

_gemname=slack-notifier
pkgname=ruby-$_gemname
pkgver=2.3.2
pkgrel=2
pkgdesc='A slim ruby wrapper for posting to slack webhooks'
arch=(any)
url='http://github.com/stevenosloan/slack-notifier'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('2b3786c697bacf6f50b91cbdefad0263b4e65ff4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
