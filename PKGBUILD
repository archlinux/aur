# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: cs-cam <me@camdaniel.com>

pkgname=qemu-launcher
pkgver=1.7.4
pkgrel=6
pkgdesc="GNOME/Gtk front-end for the Qemu x86 PC emulator"
url="http://gna.org/projects/qemulaunch"
license=('GPL')
arch=('any')
depends=('qemu' 'gtk2-perl' 'glade-perl' 'perl-locale-gettext' 'xdg-utils')
makedepends=('libxml2')
source=("${pkgname}_${pkgver}.tar.gz::https://launchpad.net/debian/+archive/primary/+sourcefiles/qemu-launcher/1.7.4-1/qemu-launcher_1.7.4.orig.tar.gz")
sha256sums=('6d55c6e15b1733ca5d580a8eca7505124acb0a15948429b99dc8f700bb05efe6')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  ln -s qemu-launcher-32x32.xpm "$pkgdir"/usr/share/pixmaps/qemu-launcher.xpm
}
