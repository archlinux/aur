# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=classifier
pkgname=ruby-$_gemname
pkgver=1.3.5
pkgrel=1
pkgdesc='A general classifier module to allow Bayesian and other types of classifications.'
arch=(any)
url='http://classifier.rufy.com/'
license=()
depends=(ruby ruby-fast-stemmer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f8efb9fb2d3c157d8893454913b32221b6dfc0bcd489a9290e2ac797f72ca3cbea6c33ceacb00187280a79989a377cb22256c4d33093e8b357027c8f8b275d33')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
