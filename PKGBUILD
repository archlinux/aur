# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Anatol Pomozov <anatol DOT pomozov AT gmail DOT com>

_gemname=gtk2
pkgname=ruby-${_gemname}
pkgver=3.4.3
pkgrel=2
pkgdesc='Ruby binding of GTK+-2.x.'
arch=(x86_64 i686)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL)
depends=(ruby gtk2 "ruby-atk>=${pkgver}" "ruby-pango>=${pkgver}" "ruby-gdk_pixbuf2>=${pkgver}")
makedepends=(ruby-native-package-installer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha1sums=('ad998d92030b2768d3f52e2b0c4364cd81017476')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
