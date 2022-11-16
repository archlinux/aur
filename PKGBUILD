# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=claide
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='A small command-line interface framework.'
arch=(any)
url='https://github.com/CocoaPods/CLAide'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f5306bade627d0370f0a06cf342a1a7f520b7a4b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
