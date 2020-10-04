# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=sinatra-contrib
pkgname=ruby-$_gemname
pkgver=2.1.0
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
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('93b6cf507ca40dbef581f47c5d639b06c277dc02')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
