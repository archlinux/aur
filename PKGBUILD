# Maintainer: Michał Wojdyła < micwoj9292 at gmail >

_gemname=google-apis-compute_v1
pkgname=ruby-$_gemname
pkgver=0.52.0
pkgrel=1
pkgdesc='simple REST client for Compute Engine API V1'
arch=(any)
url='https://rubygems.org/gems/google-apis-compute_v1'
license=(Apache-2.0)
depends=(ruby-google-apis-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('522d30a0b426c8f93a2b944438b551ee3f6f1ae721fd7eab729864ef9d59fbe5acad07c46769b442fc2424f1f05b6bfd8c6f716f752f70880fcac92a35cc1bc4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
