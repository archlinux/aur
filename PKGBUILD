# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: kappa <kappacurve at gmail dot com>

pkgname=gimp-plugin-normalmap
_pkgname=gimp-normalmap
pkgver=1.2.3
pkgrel=1
pkgdesc="A Gimp plugin for converting images into RGB normal maps"
url="http://code.google.com/p/gimp-normalmap/"
arch=('i686' 'x86_64')
license=("GPL")
depends=('gimp' 'gtkglext' 'glew')
conflicts=('gimp-normalmap')
replaces=('gimp-normalmap')
source=(http://gimp-normalmap.googlecode.com/files/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('a7b07bae2c8c62892f8a8490d73e89367930f85e')
options=(!strip)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make LDFLAGS=-lm
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m 755 ./normalmap ${pkgdir}/usr/lib/gimp/2.0/plug-ins/normalmap
}
