# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

_pkgname=xfce4-genmon-plugin
pkgname=${_pkgname}-gtk2
pkgver=3.4.0
pkgrel=1
pkgdesc="Plugin that monitors customizable programs stdout for the Xfce4 panel (GTK2 version)"
arch=('i686' 'x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('LGPL2.1')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(http://archive.xfce.org/src/panel-plugins/$_pkgname/3.4/$_pkgname-$pkgver.tar.bz2)
sha256sums=('b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387')

build() {
  cd "$srcdir/$_pkgname-3.4"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-3.4"
  make DESTDIR="$pkgdir" install
}
