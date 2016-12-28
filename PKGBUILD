# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=url_mount
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=1
pkgdesc="Glue to allow mounted rack applications to know where they're mounted."
arch=(any)
url='https://github.com/hassox/url_mount'
license=(MIT)
depends=(ruby ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('44b98f9d08ed550a1421679fdf2e1c112bce66950f87a63c6205d4783a0566ad')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
