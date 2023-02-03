# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aws
pkgname=ruby-$_gemname
pkgver=3.16.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Amazon Web Services.'
arch=(any)
url='http://github.com/fog/fog-aws'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('636e06fd8b7305f2697ffcbbd0d9849f1fa8879b7f66035be636e8081a0e78cb1d2fc77e268673d9a5b1d866ed7de2ce1579f582aafaff31a0440999d73f0dc4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
