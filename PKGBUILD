# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-profitbricks
pkgname=ruby-$_gemname
pkgver=0.0.1
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support ProfitBricks.'
arch=(any)
url='https://github.com/fog/fog-profitbricks'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml ruby-nokogiri)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha512sums=('f103857f95faae8282e05801fd889b084bbb48c25f6d8e10bc46efde40c5e30e5f174f6054138a3b8093bbcf2cfa1b1bff6b04840cb4e1cc182ae9acae7ba44e')
