# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=cani
pkgver=0.5.5
pkgrel=1
pkgdesc='A TUI wrapper around caniuse data using FZF and curses'
arch=(x86_64)
url='https://github.com/SidOfc/cani'
license=(MIT)
depends=(ruby fzf ruby-colorize ruby-curses ruby-json)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('9f946634a9ac6eea25a9a224efe3aa97e39ded438cc64fb8762d57eecf0dea4d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
