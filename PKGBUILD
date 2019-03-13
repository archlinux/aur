# Maintainer: farawayer <farwayer@gmail.com>

_gemname=mini_magick
pkgname=ruby-$_gemname-4.5
pkgver=4.5.1
pkgrel=5
pkgdesc='Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick'
arch=(any)
url='https://github.com/minimagick/minimagick'
license=(MIT)
provides=('ruby-mini_magick=4.5')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('010d12f41d99b9064583778da44f6ff05d566434')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
