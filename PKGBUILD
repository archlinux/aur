# Maintainer: Nicolas Formichella <stigpro@outlook.fr>
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-gstreamer
_pkgname=${pkgname#ruby-}
pkgver=3.4.6
pkgrel=1
pkgdesc='Ruby/GStreamer is a Ruby binding for GStreamer.'
arch=('any')
url='http://ruby-gnome2.osdn.jp/'
license=(LGPL)
depends=('gstreamer' 'ruby-gobject-introspection')
makedepends=('ruby-pkg-config')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
sha512sums=('a1fb484f6fb3e23398e76e374eda190a48cbd14ff69abeeda29ccba2146035e19a0477ed353e6d5a251411e74d72d4409020a6365f01bc6b7e0d25c51eb8eca2')
noextract=($_pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_pkgname-$pkgver.gem"
}
