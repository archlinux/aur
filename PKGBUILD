# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=arel
pkgname=ruby-$_gemname
pkgver=6.0.3
pkgrel=1
pkgdesc='Arel Really Exasperates Logicians  Arel is a SQL AST manager for Ruby'
arch=(any)
url='https://github.com/rails/arel'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('abe0ba49438584681ea4a0ac0ab4bfa4e5fbb17a776e0d0845645fd479aa28f34ad7f653acdbf846a53ee3540bf7bf42cf631f8fc21571d5c36f68c1bbb74ff2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.txt"
}
