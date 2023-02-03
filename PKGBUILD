# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=cani
pkgver=0.5.9
pkgrel=2
pkgdesc='A TUI wrapper around caniuse data using FZF and curses'
arch=(x86_64)
url='https://github.com/SidOfc/cani'
license=(MIT)
depends=(ruby fzf ruby-colorize ruby-curses ruby-json ruby-tty-screen)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('bd88ffbc9967c6fe3a087a72149cf1c7184ea69a4d8b22fdb86a52e4e381218c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
