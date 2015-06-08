# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=fluent-plugin-dstat
pkgver=0.2.5
pkgrel=1
pkgdesc='Dstat Input plugin for Fluent event collector'
arch=('any')
url='http://github.com/shun0102/fluent-plugin-dstat'
license=('Apache')
depends=('dstat' 'fluentd')
options=(!emptydirs)
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  fluent-gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('04af8891c038210099be4505ac2f5180')
