# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=wcmcommander
_pkgname=WCMCommander
pkgver=0.20.0
_pkgver=release-${pkgver}
pkgrel=1
pkgdesc="Multi-platform open source file manager (Windows, Linux, FreeBSD, OS X) mimicking the look-n-feel of Far Manager"
arch=('i686' 'x86_64')
url=http://wcm.linderdaum.com/
license=('GPL2')
depends=('libx11' 'libssh2' 'smbclient' 'freetype2')
source=("https://github.com/corporateshark/${pkgname}/archive/${_pkgver}.tar.gz")
sha1sums=('77f034f0da7f13b362b742b965ad9fb444892802')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make all
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
