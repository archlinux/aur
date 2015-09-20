# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=git
pkgname=ruby-$_gemname
pkgver=1.2.9.1
pkgrel=1
pkgdesc="Ruby/Git is a Ruby library that can be used to create, read and manipulate Git repositories by wrapping system calls to the git binary."
arch=(any)
url="https://github.com/schacon/ruby-git"
license=('MIT')
depends=('ruby' 'git')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('9aa9a279bb45fe8a22e0799a3dbf80d7fd4866bc733256d52fec505829920eeb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
