#
# PKGBUILD for view64
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=view64
pkgver=1.61
pkgrel=1
epoch=
pkgdesc="SDL image viewer for Commodore C64 image formats"
arch=('i686' 'x86_64')
url="http://view64.sourceforge.net/"
license=('GPL-2.0-only')
groups=()
depends=('glibc' 'glib2' 'sdl2' 'fltk' 'libfltk.so')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/view64/files/source/${pkgname}-${pkgver}-src.zip)
noextract=()
sha256sums=('bb1320165a183e8b22b5a265623097e124a366234911237264b574e397d4c40b')

prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver}-src"
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  make
}

check()
{
  cd "${srcdir}/${pkgname}-${pkgver}-src"
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  make install PREFIX="${pkgdir}/usr"

  # mkdir
  #install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/etc/"
  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/"

  # files
  install -m 644 view64.conf "${pkgdir}/etc/"
  install -m 644 magic "${pkgdir}/etc/magic.${pkgname}"
  install -m 644 mailcap "${pkgdir}/etc/mailcap.${pkgname}"
  install -m 644 README "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m 644 README.html "${pkgdir}/usr/share/doc/${pkgname}/"
}

#
# EOF
#
