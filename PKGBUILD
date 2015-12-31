# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

_gemname=utilrb
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=1
pkgdesc="Yet another Ruby toolkit, in the spirit of facets"
arch=(any)
url="http://utilrb.rubyforge.org/utilrb/"
license=('GPL')
depends=('ruby' 'ruby-facets')
makedepends=('rubygems')
options=(!emptydirs)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('40cd96da62f2019e4364a2d93a387c49')
sha256sums=('eb00417f391f40b0703e37af9e28dbbd2ffbddfd0c288f6656b39437d799668c')
sha384sums=('fdccf0c3cc035f4fc8b053ae2bb44c846726826776512ffe6048917f83f43b1f44526c2a5920dad9521d1aedc6f41f06')
sha512sums=('5445c3e281704fc22df23750d735b8c3fd949d790dd1337100141a1f441223d0491fb81b75a7d35042a0d0cf0c022e94de8b36db75ba624e8e0dbadeea7aaa03')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
