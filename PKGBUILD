# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=read-it-later-git
_pkgname=read-it-later
pkgver=0.0.2.r144.ce19c0d
pkgrel=1
pkgdesc='A wallabag client GTK GUI'
arch=('i686' 'x86_64')
url='https://belmoussaoui.com/article/7-first-release-read-it-later'
license=('GPL3')
provides=(${pkgname%-*})
conflicts=()
depends=('appstream-glib' 'libhandy0' 'webkit2gtk')
makedepends=('git' 'meson' 'rust')
source=('git+https://gitlab.gnome.org/World/read-it-later.git')
sha512sums=('SKIP')
builddir=build

build() {
  arch-meson "${srcdir}/${_pkgname}" "$builddir"
  meson compile -C "$builddir"
}

check() {
  meson test -C "$builddir"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$builddir"
}

