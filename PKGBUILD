# Maintainer: farawayer <farwayer@gmail.com>

_gemname=fastimage
pkgname=ruby-$_gemname
pkgver=2.1.7
pkgrel=1
pkgdesc='FastImage - Image info fast'
arch=(any)
url='http://github.com/sdsykes/fastimage'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('303270e1f04308bf8bb344172aac860c626ad3bb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
