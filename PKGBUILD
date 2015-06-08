# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Adam Lloyd <lloyda2 (at) rpi (dot) edu>

pkgname=maruku
pkgver=0.6.1
pkgrel=2
pkgdesc="A Markdown-superset interpreter"
arch=(any)
url="http://maruku.rubyforge.org/"
license=('GPL2')
depends=(ruby ruby-syntax)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/maruku-$pkgver.gem)
noextract=(maruku-$pkgver.gem)
md5sums=('b919c2b706ca83502a8bec0be5c16c6d')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" maruku-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
