# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-view
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='View layer for Hanami.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-tilt)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4ac584a37507b52c84dc647dda223c35849ecf3ff9be8c7b90f8d661e1ee5b1b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
