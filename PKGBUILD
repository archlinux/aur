# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=mini_magick
pkgname=ruby-$_gemname
pkgver=4.2.7
pkgrel=2
pkgdesc="Manipulate images with minimal use of memory via ImageMagick."
arch=(any)
url="https://github.com/minimagick/minimagick"
license=('MIT')
depends=('ruby' 'imagemagick' 'ruby-subexec')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('24f56c4561e9406d40f637a5f1ea9bc469fbd3b549c692061868fb7c054ff386')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
