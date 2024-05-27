# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

_gemname=utilrb
pkgname=ruby-$_gemname
pkgver=3.1.0
pkgrel=1
pkgdesc="Yet another Ruby toolkit, in the spirit of facets"
arch=(any)
url="http://utilrb.rubyforge.org/utilrb/"
license=('GPL')
depends=('ruby' 'ruby-facets')
makedepends=('rubygems')
options=(!emptydirs)
source=(http://rubygems.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('da9d1162c7386e668fb8362fdf5142bcef32cc444fe7e8f8e79af02e476686d4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
