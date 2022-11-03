# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-iamcredentials_v1
pkgname=ruby-$_gemname
pkgver=0.16.0
pkgrel=1
pkgdesc='simple REST client for IAM Service Account Credentials API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-iamcredentials_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8bf009c7fac542b0bb87ea4050c93998323aafc7d2953fff4a5539e22e62a61d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

