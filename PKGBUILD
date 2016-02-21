# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=sawyer
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc="Secret User Agent of HTTP."
arch=(any)
url="https://github.com/lostisland/sawyer"
license=('MIT')
depends=('ruby' 'ruby-addressable<2.5>=2.3.5' 'ruby-faraday<0.10')
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('8f63adfc9c544f88280a18e7bab25c193d6e0aab5973f07774b838c40ce7f7da6f148d6122ccd9e3824eb292389d994c84e2460460f7b6f9f340b27f331d59bd')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
