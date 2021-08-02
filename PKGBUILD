# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad
pkgver=5.2.1a
_srcname="xtrkcad-setup-5.2.1a-1.x86_64.sh"
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://xtrkcad-fork.sourceforge.net/"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=("https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%205.2.1/xtrkcad-setup-5.2.1a-1.x86_64.sh")
sha256sums=('b567e1654cf50aba8f53f2aced419ee115744e8b289c076fb9d6efffa967bcb6')

build() {
  chmod 0777 "${_srcname}"
  mkdir usr
  ./${_srcname} --skip-license --prefix="usr"
}

package() {
  cp -r "./usr" "${pkgdir}"
}
