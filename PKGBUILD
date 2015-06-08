# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=fluentd
pkgname=$_gemname
pkgver=0.10.60
pkgrel=1
pkgdesc="A tool to collect events and logs"
arch=('any')
url="http://fluentd.org/"
license=('Apache')
depends=('ruby' 'ruby-cool.io' 'ruby-json' 'ruby-http_parser.rb-0.5' 'ruby-msgpack' 'ruby-sigdump' 'ruby-tzinfo-data' 'ruby-yajl-ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-ri --no-rdoc -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

md5sums=('1d07f879d7db30cad26afa015850350e')
