# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=httmultiparty
pkgname=ruby-$_gemname
pkgver=0.3.16
pkgrel=2
pkgdesc='HTTMultiParty is a thin wrapper around HTTParty to provide multipart uploads.'
arch=(any)
url='https://github.com/jwagener/httmultiparty'
license=(MIT)
depends=(ruby ruby-httparty ruby-multipart-post ruby-mimemagic)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5b0bf5403ff9f26e5771cc10f8bb757cc2b9aa39a839790439f39996ec90bc6c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
