# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

_gemname=to_slug
pkgname=ruby-$_gemname
pkgver=1.0.8
pkgrel=3
pkgdesc="Extends ruby's String class and adds a 'to_slug' method. It makes ugly strings URL friendly."
arch=(any)
url="https://github.com/ericboehs/to_slug"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('84d6736e062f3c9ba67736dda593e88f38b92315951b4b837bacc2c62970e6366356f3716483d4ecb9e4c0b8ebdb288004e9a922368c7bd519666f20f95353db')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
   -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
