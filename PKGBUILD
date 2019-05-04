# Contributor: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgname=passbook
pkgver=0.8
pkgrel=1
pkgdesc='A password manager for GNOME'
arch=('any')
url='https://gitlab.gnome.org/gnumdk/passbook'
license=('GPL')
depends=(
  'gtk3' 'python-cairo'
  'python-dbus' 'python-gobject'
)
optdepends=(
  'python-pykeepass'
)
makedepends=(
  'git' 'gobject-introspection' 'intltool' 'itstool' 'meson' 'python'
)
source=("git+https://gitlab.gnome.org/gnumdk/passbook.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson passbook build \
    --libexecdir='lib/passbook'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
