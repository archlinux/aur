# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=cani
pkgver=0.5.6
pkgrel=1
pkgdesc='A TUI wrapper around caniuse data using FZF and curses'
arch=(x86_64)
url='https://github.com/SidOfc/cani'
license=(MIT)
depends=(ruby fzf ruby-colorize ruby-curses ruby-json)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('60da403f97cd2c4efc4896794c04a7b1a3dfb3d41534ae638ed3074f3b421134')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
