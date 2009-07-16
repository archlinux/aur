# $Id: PKGBUILD,v 1.8 2009/07/15 12:08:00 cprimier Exp $
# Maintainer: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.14.5
pkgrel=1
pkgdesc="A free music education software to train rhythm, interval, scale and chord skills"
arch=('i686' 'x86_64')
url="http://www.solfege.org/"
license=('GPL')
depends=('gnome-python' 'libgtkhtml')
makedepends=('ghostscript' 'gnome-doc-utils' 'librsvg' 'libxslt' 'lilypond' 'pkgconfig'
             'swig' 'texinfo' 'txt2man')
optdepends=('timidity: midi software output'
            'timidity-freepats: midi sound patches')
source=(http://downloads.sourceforge.net/sourceforge/solfege/${pkgname}-${pkgver}.tar.gz
        solfege.desktop)
md5sums=('2155e29de39862c5bffeae32093533ed' '73e7282bd9415769acbf2a492ca202a1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/solfege.desktop ${pkgdir}/usr/share/applications/solfege.desktop
}

# vim:set ts=2 sw=2 et:
