# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=ruby2_keywords
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc='Shim library for Module#ruby2_keywords'
arch=(any)
url='https://github.com/ruby/ruby2_keywords'
license=(RUBY)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0be571aacb5d6a212a30af3f322a7000d8af1ef9')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
