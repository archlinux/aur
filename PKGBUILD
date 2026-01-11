# $Id: PKGBUILD 96907 2013-09-07 17:50:24Z bgyorgy $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: phrakture <aaronmgriffin -at- gmail.dot.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=windowlab
pkgver=1.40
pkgrel=4
pkgdesc="A small and simple window manager."
arch=('i686' 'x86_64')
url="http://www.nickgravgaard.com/windowlab"
license=('GPL')
depends=('libxft' 'libxext')
source=("http://ftp.slackware.com/pub/gentoo/distfiles/02/${pkgname}-${pkgver}.tar"
        'xft.patch')
md5sums=('346f8c187838a446b4cbb2326d035577'
         '51e5a2d48c6d5837786f2571ccc1ce72')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ../xft.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make PREFIX=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make PREFIX=/usr CONFPREFIX="" MANDIR=${pkgdir}/usr/share/man/man1 DESTDIR=${pkgdir} install
}
