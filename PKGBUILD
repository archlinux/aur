# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Ethan Best <kc9ydn@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_gemname=gdk3
pkgname=ruby-${_gemname}
pkgver=3.2.5
pkgrel=1
pkgdesc='Ruby/GDK3 is a Ruby binding of GDK-3.x.'
arch=('x86_64')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL2.1')
depends=('ruby-cairo-gobject' 'ruby-gdk_pixbuf2' 'ruby-gobject-introspection' 'ruby-pango')
makedepends=('ruby-rake' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('0c6391407ec623005a67badd3565b13ede6ae4935db5540c7a94a1198c852c85')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
