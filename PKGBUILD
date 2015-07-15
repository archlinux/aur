# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=chronic
pkgname=ruby-$_gemname-old
pkgver=0.9.1
pkgrel=1
pkgdesc="Chronic is a natural language date/time parser written in pure Ruby."
arch=(any)
url="http://github.com/mojombo/chronic"
license=('MIT')
depends=(ruby)
conflicts=('ruby-chronic')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('13739596a4e0c4bf8a6495809f1647d26151100fa3df4dc3f4db1fef6e57574f')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
