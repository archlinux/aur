# Maintainer: needkelp <needkelp1@gmail.com>

pkgname=gtkwave-git
pkgver=3.4
pkgrel=1
pkgdesc='GTKWave is a fully featured GTK+ based wave viewer for Unix and Win32 which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing'
arch=(x86_64)
url=https://gtkwave.sourceforge.net/
license=('GPL-2.0' 'MIT')
depends=('gtk3' 'judy' 'bzip2' 'libpeas-2' 'gtk4' 'glib2' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'zlib' 'gdk-pixbuf2' 'cairo' 'pango')
makedepends=('meson' 'glib2-devel' 'gcc' 'gobject-introspection' 'git')
source=('git+https://github.com/gtkwave/gtkwave.git')
sha256sums=('SKIP')

_srcdir=gtkwave

build() {
  cd $_srcdir
  meson setup build --prefix=/usr
}

package() {

  cd $_srcdir

  # Install LICENSE
  install -D -m644 LICENSE.TXT \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"

  cd ./build

  meson install --destdir="${pkgdir}"

}
