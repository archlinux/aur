# Maintainer: Olivier Biesmans <olivier at biesmans dot fr>
_gemname=avl_tree
pkgname=ruby-avl-tree
pkgver=1.1.3
pkgrel=1
pkgdesc="AVL tree and Red-black tree in Ruby"
arch=(any)
url="https://rubygems.org/gems/avl_tree"
license=('GPL')
depends=(ruby)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(b47d2a860410afddf204f161027cda164b61bf1cd758ddc0b1ef0856677b73d8)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
