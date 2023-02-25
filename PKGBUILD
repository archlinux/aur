# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=google-apis-iamcredentials_v1
pkgname=ruby-$_gemname
pkgver=0.17.0
pkgrel=1
pkgdesc='simple REST client for IAM Service Account Credentials API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-iamcredentials_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9a6525cfd6ef1c9a355f593bfef11bd0fb30e1d785ef9e5c9da51c3817a0517b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

