# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-gstreamer
_pkgname=${pkgname#ruby-}
pkgver=3.4.2
pkgrel=1
pkgdesc='Ruby/GStreamer is a Ruby binding for GStreamer.'
arch=('any')
url='http://ruby-gnome2.osdn.jp/'
license=(LGPL)
depends=('gstreamer' 'ruby-gobject-introspection')
makedepends=('ruby-pkgconfig')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
sha512sums=('67e7bc822ab971cc9184a57239413c117df507be1fb56cc588f7d567a57ed25113152111744faea825e8436d022f26cdff1e115a097defb7472e81f6971d7549')
noextract=($_pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_pkgname-$pkgver.gem"
}
