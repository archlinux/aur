# Regurgitated due to it being succumed by xorgproto withOUT its' content being included !!
# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# $Id: PKGBUILD 286791 2017-01-17 20:23:41Z andyrtr $
# Past-Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=printproto-fix
_pkgname=printproto
pkgver=1.0.5
pkgrel=1
pkgdesc="X11 print extension wire protocol"
arch=('any')
makedepends=('xorg-util-macros')
license=('custom')
url="https://xorg.freedesktop.org/"
source=("${url}/releases/individual/proto/${_pkgname}-${pkgver}.tar.bz2")
sha1sums=('4ddb7781ebc2418d681a6f5e16d777aed56ea35e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
