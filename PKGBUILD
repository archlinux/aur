# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=css_parser
pkgname=ruby-$_gemname
pkgver=1.9.0
pkgrel=3
pkgdesc='Ruby CSS parser.'
arch=(any)
url='https://github.com/premailer/css_parser'
license=(MIT)
depends=(ruby ruby-addressable)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('974538ad8b756e18a8fa4bbf0a0adac1ab612013')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
