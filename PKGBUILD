# Maintainer: Jameson Pugh <imntreal@gmail.com>

_gemname=sshkey
pkgname=ruby-$_gemname
pkgver=1.9.0
pkgrel=1
pkgdesc='SSH private and public key generator in pure Ruby'
arch=(any)
url='https://github.com/bensie/sshkey'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3015e0ad867ee409601fbb199069822dd8619dcdb19fbb1225bf34090aa4023c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
