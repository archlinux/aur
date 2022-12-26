# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-sqladmin_v1beta4
pkgname=ruby-$_gemname
pkgver=0.41.0
pkgrel=1
pkgdesc='simple REST client for Cloud SQL Admin API V1beta4'
arch=(any)
url='https://rubygems.org/gems/google-apis-sqladmin_v1beta4'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('551553b6481879f1cd39fb83cc2a2c2ea9334afc4bf261b96900dd559f96749d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

