# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=mailnagtray
pkgver=0.1
pkgrel=1
pkgdesc="A tray icon applet for mail monitoring using Mailnag"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jgmdev/mailnagtray"
license=('GPL')
depends=('mailnag' 'qt6-base' 'imagemagick')
makedepends=('meson' 'qt6-tools')
optdepends=('gnome-control-center: administer online accounts')
source=("https://github.com/jgmdev/mailnagtray/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup build --prefix /usr
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}
