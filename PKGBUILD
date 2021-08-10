# Maintainer: Nicolas Formichella <stigpro@outlook.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-gstreamer
_pkgname=${pkgname#ruby-}
pkgver=3.4.9
pkgrel=1
pkgdesc='Ruby/GStreamer is a Ruby binding for GStreamer.'
arch=('any')
url='http://ruby-gnome2.osdn.jp/'
license=(LGPL)
depends=('gstreamer' 'ruby-gobject-introspection')
makedepends=('ruby-pkg-config')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
sha512sums=('c34fa35c394f9c290efcc433df5c58e531a5f6a6f253072d955e280b4f685d8a14617afdc7c6a16534a087d9a02cb655b42903561d88715bb01787d788266c22')
noextract=($_pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_pkgname-$pkgver.gem"
  
}
