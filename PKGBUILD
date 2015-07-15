# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=chronic
pkgname=ruby-$_gemname
pkgver=0.10.2
pkgrel=1
pkgdesc="Chronic is a natural language date/time parser written in pure Ruby."
arch=(any)
url="http://github.com/mojombo/chronic"
license=('MIT')
depends=(ruby)
conflicts=('ruby-chronic-old')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('08a655a971a93f476e2a827365973f57')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
