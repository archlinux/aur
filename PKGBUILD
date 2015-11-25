# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=inflecto
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc='Inflector for strings'
arch=(any)
url='https://github.com/mbj/inflecto'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('dbd1aa3a199365aa301d2570894e347e4f4fe6202924d6337b936ce3e5ed934e7e5c57c6c4ade42d6e0ffa43c574f3ac530ec6dccc6ad8d16b6ff96e4d057628')
