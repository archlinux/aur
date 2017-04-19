# Maintainer: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=libxfce4ui-git
pkgver=4.13.1.r38.gccb432c
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications - git checkout"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
depends=('libxfce4util>=4.12.0' 'gtk2>=2.24.0' 'xfconf>=4.12.0' 'libsm' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc')
optdepends=('gtk3>=3.2.0: GTK+ 3 support'
            'startup-notification>=0.4: startup notification library')
provides=("libxfce4ui=${pkgver}")
conflicts=("libxfce4ui")
source=($pkgname::git://git.xfce.org/xfce/libxfce4ui)
sha256sums=('SKIP')

build() {
  cd "libxfce4ui-git"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
#    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "libxfce4ui-git"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
