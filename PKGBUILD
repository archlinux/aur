# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-koala
_gemname=koala
pkgver=3.0.0
pkgrel=1
pkgdesc='A lightweight Facebook library supporting the Graph, Marketing, and Atlas APIs, realtime updates, test users, and OAuth'
arch=('any')
url='https://github.com/arsduo/koala'
license=('MIT')
depends=('ruby' 'ruby-faraday')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=('$_gemname-$pkgver.gem')
md5sums=('32826fd1865ec601a321399e4371a699')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}