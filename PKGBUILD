# Maintainer: farawayer <farwayer@gmail.com>

_gemname=word_wrap
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=3
pkgdesc='Simple tool for word-wrapping text'
arch=(any)
url='https://github.com/pazdera/word_wrap'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c31c4eae95d0dadaecbf911ba7ce1c6067d009b5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
