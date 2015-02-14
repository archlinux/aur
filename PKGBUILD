# Maintainer: fzerorubigd <fzerorubigd {AT} gmail>
_gemname=skinny
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=1
pkgdesc="Simple, upgradable WebSockets for Thin."
arch=(any)
url="http://github.com/sj26/skinny"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
conflicts=('skinny')
provides=('skinny')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

md5sums=('bf45ec49e628b05c88eac37fb9e8e8f1')