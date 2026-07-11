# Maintainer: kelon

pkgname=wingpanel-indicator-sysmon
pkgver=0.6.6.r0.gad58f45
pkgrel=1
pkgdesc="Wingpanel indicator for displaying system resources usage (CPU, RAM, network, disk)"
arch=('x86_64')
url="https://github.com/GalileoNio/wingpanel-indicator-sysmon"
license=('GPL3')
depends=(
  'glib2'
  'gtk3'
  'granite'
  'libgee'
  'libgtop'
  'libhandy'
  'wingpanel'
)
makedepends=('git' 'meson' 'vala' 'ninja')
source=("$pkgname::git+https://github.com/GalileoNio/$pkgname.git#commit=ad58f45441726f6b9ac1ea544056b81c0cf31353")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  arch-meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
