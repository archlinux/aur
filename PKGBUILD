# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=ruby-open4
_gemname=open4
pkgver=1.3.4
pkgrel=1
pkgdesc="Open and manage child processes and their io handles easily."
arch=('any')
url="https://github.com/ahoward/open4"
license=('Ruby')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('41a7fe9f8e3e02da5ae76c821b89c5b376a97746')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
