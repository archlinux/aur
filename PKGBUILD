# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=fluent-plugin-mongo
pkgver=0.7.7
pkgrel=1
pkgdesc='MongoDB plugin for Fluent event collector'
arch=('any')
url='http://docs.fluentd.org/articles/out_mongo'
license=('Apache')
depends=('fluentd' 'ruby-mongo')
options=(!emptydirs)
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  fluent-gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('ad85e1aa01876ec0fc5e17d7e4871aed')
