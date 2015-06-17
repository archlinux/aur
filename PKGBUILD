_gemname=fast-stemmer
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Fast Porter stemmer based on a C version of algorithm'
arch=(i686 x86_64)
url='http://github.com/romanbsd/fast-stemmer'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b577a60cbb90838679744d6484a89bfc4386980f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
