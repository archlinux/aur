# Maintainer: farawayer <farwayer@gmail.com>

_gemname=mini_magick
pkgname=ruby-$_gemname-4
pkgver=4.9.5
pkgrel=1
pkgdesc='Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick'
arch=(any)
url='https://github.com/minimagick/minimagick'
license=(MIT)
provides=('ruby-mini_magick=4.9.5')
depends=(
  ruby
  imagemagick
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4be7e566c08bac47e08fdac7c9ca3678926fe5c6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
