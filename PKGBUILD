# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-configurable
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc='A mixin to add configuration functionality to your classes.'
arch=(any)
url='https://github.com/dryrb/dry-configurable'
license=(MIT)
depends=(ruby ruby-concurrent-ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('013e872a005d2557f625a58cc7269926e1fb62db956d1b98aa0e76138db0c60c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
