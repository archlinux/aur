# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-jsonpath
_gemname=jsonpath
pkgver=1.0.5
pkgrel=1
pkgdesc='Ruby implementation of http://goessner.net/articles/JsonPath'
arch=('any')
url='https://github.com/joshbuddy/jsonpath'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=('$_gemname-$pkgver.gem')
md5sums=('935d7c185d5f4d4983437b5862e7d74c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}