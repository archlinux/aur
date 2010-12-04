# Contributor: Leonidas <marek@xivilization.net>
pkgname=homesick
pkgver=0.6.1
pkgrel=1
pkgdesc="A man's home is his castle. Never leave your dotfiles behind."
arch=(any)
url="http://github.com/technicalpickles/homesick"
license=('MIT')
depends=(ruby ruby-thor)
# well, rubygems is part of the ruby package nowadays, but *shrug*
makedepends=(rubygems)
source=(http://rubygems.org/downloads/homesick-$pkgver.gem)
noextract=(homesick-$pkgver.gem)
md5sums=('27c8c96fb6b5c41f3edbec083f85bea5')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" homesick-$pkgver.gem
}
