# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: gem2arch (https://github.com/anatol/gem2arch)

_gemname=einhorn
pkgname=ruby-$_gemname
pkgver=0.5.7
pkgrel=1
pkgdesc='Language-independent shared socket manager'
arch=('any')
url='https://github.com/stripe/einhorn'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('40e0d5041968029523affc5f0479457af59d56583f6d835d2337fa15bdf254d2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
