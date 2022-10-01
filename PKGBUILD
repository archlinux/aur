# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aws
pkgname=ruby-$_gemname
pkgver=3.15.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Amazon Web Services.'
arch=(any)
url='http://github.com/fog/fog-aws'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('cf18f6a73b50406ae0d7dbd3b7b5b9be42551dd7657ad69f4195fc718c8cdc294a1506ee78090b9157b6f2d5ccb56e55bcfa617f3300cf9ab66876e36915976e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
