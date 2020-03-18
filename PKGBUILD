# Maintainer: twa022 <twa022 at gmail dot com>

_gemname=minima
pkgname=ruby-$_gemname
pkgver=2.5.1
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
sha256sums=('520e52bc631fb16cbb8100660f6caa44f97859e2fa7e397d508deb18739567be')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
