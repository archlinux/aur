# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=fluentd
pkgname=$_gemname
pkgver=1.11.0
pkgrel=1
pkgdesc='Open source data collector designed to scale and simplify log management. It can collect, process and ship many kinds of data in near real-time.'
arch=('any')
url="http://fluentd.org/"
license=('Apache')
#depends=('ruby' 'ruby-cool.io' 'ruby-json' 'ruby-http_parser.rb-0.5' 'ruby-msgpack' 'ruby-sigdump' 'ruby-tzinfo-data' 'ruby-yajl-ruby')
depends=('ruby' 'ruby-json' 'ruby-msgpack' 'ruby-tzinfo' 'ruby-concurrent')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha512sums=('14289ac3174ae417bafcf78e4574fd4f0d84799def9d47629ea36679d08d74c6c2eb4dd72b1915177f6eadd03e26779beda59c0e7bf9e6087f26bebcf8561daa')
package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
#  gem install --ignore-dependencies --no-user-install --no-ri --no-rdoc -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  gem install --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
