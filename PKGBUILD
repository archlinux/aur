# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=xfdashboard
pkgver=1.0.0
pkgrel=2
pkgdesc="Maybe a Gnome shell like dashboard for Xfce"
arch=('x86_64')
url="https://docs.xfce.org/apps/xfdashboard/start"
license=('GPL-2.0-or-later')
depends=('libwnck3' 'clutter' 'garcon')
makedepends=('git' 'glib2-devel' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/apps/xfdashboard.git#tag=$pkgver")
sha256sums=('9a5292d4f34db19068c99e696e61b4fc2fd20465e357f82100070e1ec261d10f')

prepare() {
  cd $pkgname
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
