# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-elitebook
pkgver=1.94.5
pkgrel=1
pkgdesc="LibFPrint fork for 06cb:00e9 Elitebook x360 1040 G7"
url="https://github.com/Aperre/libfprint-elitebook"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection)
checkdepends=(cairo)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
_commit=db70f8a16a81220256d861e704c2b771668754a5
source=("git+https://github.com/Aperre/libfprint-elitebook.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  echo $pkgver
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
