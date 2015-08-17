# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=rmail-sup
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc="RMail is a lightweight mail library containing various utility classes and modules that allow ruby scripts to parse, modify, and generate MIME mail messages."
arch=(any)
url="https://rubygems.org/gems/rmail-sup"
license=('unknown')
depends=(ruby)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('6ff1575a8e84d68c7e589d03a39adf75')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
