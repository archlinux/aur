# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=sinatra-contrib
pkgname=ruby-$_gemname
pkgver=2.0.8.1
pkgrel=1
pkgdesc='Collection of useful Sinatra extensions'
arch=(any)
url='http://sinatrarb.com/contrib/'
license=(MIT)
depends=(ruby
         ruby-sinatra
         ruby-mustermann
         ruby-backports
         ruby-tilt
         ruby-rack-protection
         ruby-multi_json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('400d357e0d491fb2a0a02eaffedcfd19e4b21470')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
