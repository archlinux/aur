# Maintainer: twa022 <twa022 at gmail dot com>

_gemname=minima
pkgname=ruby-$_gemname
pkgver=2.5.2
pkgrel=1
pkgdesc='A beautiful, minimal theme for Jekyll'
arch=(any)
url='https://github.com/jekyll/minima'
license=(MIT)
depends=('jekyll')
makedepends=('ruby-rake')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9c434e3b7bc4a0f0ab488910438ed3757a0502ff1060d172f361907fc38aa45a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
