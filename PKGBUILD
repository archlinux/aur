# Maintainer: James An <james@jamesan.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-gstreamer
_pkgname=${pkgname#ruby-}
pkgver=3.4.1
pkgrel=1
pkgdesc='A Ruby binding for GStreamer'
arch=('any')
url='http://ruby-gnome2.osdn.jp/'
license=(LGPL)
depends=('gstreamer' 'ruby-gobject-introspection')
makedepends=('ruby-pkgconfig')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
sha512sums=('8cf3824ce2935a68c30580c40498891b463872d22372eb5ec392c23802c91234dcae685f7fa766cddda931bfaebf525d20f1f32365e72def6731f206f9b9889e')
noextract=($_pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_pkgname-$pkgver.gem"
}
