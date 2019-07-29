# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=cani
pkgver=0.5.8
pkgrel=1
pkgdesc='A TUI wrapper around caniuse data using FZF and curses'
arch=(x86_64)
url='https://github.com/SidOfc/cani'
license=(MIT)
depends=(ruby fzf ruby-colorize ruby-curses ruby-json)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('2ec7a4ea8d2f549c1c6feb8ab7288dab09070536712187db213133fffed89d76')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
