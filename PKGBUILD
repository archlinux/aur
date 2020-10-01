# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_gemname=mini_exiftool
pkgname=ruby-$_gemname
pkgver=2.10.0
pkgrel=2
pkgdesc='A wrapper for the ExifTool command-line application'
arch=(any)
url='https://github.com/janfri/mini_exiftool'
license=('LGPL2.1')
depends=(
	'ruby'
	'perl-image-exiftool'
	)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('1cd78896a4825c7b693ca8e68c1b3b532cef3733df0cac3289a98c66631cb968')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
