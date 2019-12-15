# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
_gemname=http-cookie
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=3
pkgdesc="A Ruby library to handle HTTP cookies in a way both compliant with RFCs and compatible with today's major browsers."
arch=(any)
url="https://github.com/sparklemotion/http-cookie"
license=('MIT')
depends=(ruby ruby-domain_name)
makedepends=(rubygems ruby-rdoc)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('2f11269d817bc52ab2af2721e89a377660a961078de2a3a55fc696d7897e8c00')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
