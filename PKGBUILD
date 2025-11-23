# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=xfdashboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Maybe a Gnome shell like dashboard for Xfce"
arch=('x86_64')
url="https://docs.xfce.org/apps/xfdashboard/start"
license=('GPL-2.0-or-later')
depends=('libwnck3' 'clutter' 'garcon')
makedepends=('git' 'glib2-devel' 'xfce4-dev-tools' 'meson')
source=("git+https://gitlab.xfce.org/apps/xfdashboard.git#tag=$pkgname-$pkgver")
sha256sums=('77c63dd175dae3282da6d0a752b70f0937f8f09ba46d1ee8ce28122e4753939d')

build() {
  arch-meson $pkgname build \
    --localstatedir=/var
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
