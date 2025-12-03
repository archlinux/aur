# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="ruby2d"
pkgname="ruby-$_gemname"
pkgver=0.12.1
pkgrel=1
arch=("any")
pkgdesc="Make cross-platform 2D applications in Ruby"
url="https://rubygems.org/gems/$_gemname"
license=("MIT")
depends=("ruby" "sdl2" "sdl2_image"
         "sdl2_mixer" "sdl2_ttf")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
b2sums=('2aae9868cf45c37db1a606870e3fcfe4c086fc075bfd7504b42549656782bcda52e7430604ac89814475809adb38e6a7460f5a15bb0a05e820943a1bf8f917bd')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
