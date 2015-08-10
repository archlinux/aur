# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
_gemname=http-cookie
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc="A Ruby library to handle HTTP cookies in a way both compliant with RFCs and compatible with today's major browsers."
arch=(any)
url="https://github.com/sparklemotion/http-cookie"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bcc1b18b5bc3e9302542c9c7f68f1ac0c3100a65dd2831786172e8676773e233')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
