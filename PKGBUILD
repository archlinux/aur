# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-gstreamer
_pkgname=${pkgname#ruby-}
pkgver=3.4.3
pkgrel=1
pkgdesc='Ruby/GStreamer is a Ruby binding for GStreamer.'
arch=('any')
url='http://ruby-gnome2.osdn.jp/'
license=(LGPL)
depends=('gstreamer' 'ruby-gobject-introspection')
makedepends=('ruby-pkgconfig')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
sha512sums=('3d02349d8e318ab9e4147b5c65dd1c99c2e516cb0e3e73aa3317555e70ea07fbc90de8ad8bd3712f9f24cac0cf19ea9b7fecc01ab8db5a8969d71c129f6c16f6')
noextract=($_pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_pkgname-$pkgver.gem"
}
