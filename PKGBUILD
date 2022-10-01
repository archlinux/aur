# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=aliyun-sdk
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc='A Ruby program to facilitate accessing Aliyun Object Storage Service'
arch=(any)
url='https://github.com/aliyun/aliyun-oss-ruby-sdk'
license=(MIT)
depends=(ruby-nokogiri ruby-rest-client)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('bd4aee54a2fb7dac498f64f8d2241b98affec55d83614abf64fe4b983366c164dae3e61ea15c9f52ef1324b3f7ee93c8d581b3b9e9006cbb8191290949dc938b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
