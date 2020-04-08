# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-jsonpath
_gemname=jsonpath
pkgver=0.5.0
pkgrel=1
pkgdesc='Ruby implementation of http://goessner.net/articles/JsonPath'
arch=('any')
url='https://github.com/joshbuddy/jsonpath'
license=('MIT')
depends=('ruby' 'ruby-multi_json')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=('$_gemname-$pkgver.gem')
md5sums=('b5dd754e81ad2ee39f92e511f50d7ef3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}