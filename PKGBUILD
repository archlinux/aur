# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_gemname=guard-nanoc
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Guard helper gem for nanoc static site generator'
arch=('any')
url='https://github.com/guard/guard-nanoc'
license=('MIT')
depends=("ruby-guard" "nanoc")
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('48366c0176ffdaa560401f609e724a1fbe62500ba9ff6366906c0531f8b1d185')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  # license
  install -Dm644 "$pkgdir/$_gemdir"/gems/$_gemname-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
