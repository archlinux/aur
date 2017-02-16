# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=sawyer
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc="Secret User Agent of HTTP."
arch=(any)
url="https://github.com/lostisland/sawyer"
license=('MIT')
depends=('ruby' 'ruby-addressable<2.5>=2.3.5' 'ruby-faraday-0.9')
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d057c34e1ee1bfc5939cfc002118fcc31579846814caa668e3633d5c04dd2437aa71b417626f669aca3a082481bf493682720260592072367af104c20fd34783')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
