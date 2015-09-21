# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=http-form_data
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc='Utility-belt to build form data request bodies. Provides support for `application/x-www-form-urlencoded` and `multipart/form-data` types.'
arch=(any)
url="https://github.com/httprb/form_data.rb"
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('09f644d2b80ee67f9957561de698a585bc8a6a86e9b7da96251639c691872683')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
