# Maintainer: Alexander Rødseth <rodseth@gmail.com>

_gemname=curses
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc='Ruby binding for curses, ncurses, and PDCurses, formerly part of the Ruby standard library'
arch=('x86_64' 'i686')
url='https://github.com/ruby/curses'
license=('Ruby' 'BSD-2-Clause')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('7bdc2df1f181357dba0c3ae1d4cc982fb3e6ee33f5f130f689540512e8ce06de')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
