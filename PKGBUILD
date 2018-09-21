# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-data-git
pkgver=2018.4.0r8691.67bf0c8e1
_pkgver=2018.4.0
pkgrel=1
pkgdesc="Base data for the flightgear flight simulator."
arch=('x86_64')
url="https://home.flightgear.org"
options=(!strip)
license=('GPL')
provides=('flightgear-data=2018.4.0')
conflicts=('flightgear-data')
replaces=('fgdata-git')
source=("flightgear-data::git+https://git.code.sf.net/p/flightgear/fgdata#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%sr%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/flightgear/"
  mv flightgear-data/ "${pkgdir}/usr/share/flightgear/data"
  chown root:root "${pkgdir}/usr/share/flightgear/data"
}

