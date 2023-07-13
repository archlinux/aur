# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-sqladmin_v1beta4
pkgname=ruby-$_gemname
pkgver=0.52.0
pkgrel=1
pkgdesc='simple REST client for Cloud SQL Admin API V1beta4'
arch=(any)
url='https://rubygems.org/gems/google-apis-sqladmin_v1beta4'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8bacbae9e28ca448f255917503c4e5ef8c5998a30a888c44945cc215fb9b0e02')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

