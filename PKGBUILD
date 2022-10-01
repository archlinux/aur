# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-iamcredentials_v1
pkgname=ruby-$_gemname
pkgver=0.15.0
pkgrel=1
pkgdesc='simple REST client for IAM Service Account Credentials API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-iamcredentials_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e9a256a6d80fbfc77d44bd7e65bc94b9e1e9863a00e6d413edc0102d6cb5551b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

