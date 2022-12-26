# Contributor: Ali Mousavi <ali.mousavi@gmail.com>

_gemname=xmlrpc
pkgname=ruby-$_gemname
pkgver=0.3.2
pkgrel=1
pkgdesc='XMLRPC is a lightweight protocol that enables remote procedure calls over HTTP.'
arch=(any)
url='https://github.com/ruby/xmlrpc'
license=(GPL3)
depends=(ruby-webrick)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7e7e4720c12460ba95dadb0d488fa6a98defd849')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
