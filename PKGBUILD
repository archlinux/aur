# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=fog-json
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='JSON parsing for fog providers'
arch=(any)
url='http://github.com/fog/fog-json'
license=(MIT)
depends=(ruby ruby-fog-core ruby-multi_json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('3fd5f8e72a5b6b62129f0c1e0e9aea11202a90a853eec172a8ad83a81c1106fe6f47966ddae3bcc04874230bc384c6efe7a83d082ab0e20bc4458b79e3f500c6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
