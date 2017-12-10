# $Id: PKGBUILD 195831 2016-11-14 17:37:54Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: cs-cam <me@camdaniel.com>

pkgname=qemu-launcher
pkgver=1.7.4
pkgrel=5
pkgdesc="GNOME/Gtk front-end for the Qemu x86 PC emulator"
url="http://gna.org/projects/qemulaunch"
license=('GPL')
arch=('any')
depends=('qemu' 'gtk2-perl' 'glade-perl' 'perl-locale-gettext' 'xdg-utils')
makedepends=('libxml2')
validpgpkeys=('11C1A43D19DBB486D98A9752CED39EF66A2FFF2E')
source=(http://download.gna.org/qemulaunch/1.7.x/${pkgname}_$pkgver.tar.gz{,.sig})
sha256sums=('6d55c6e15b1733ca5d580a8eca7505124acb0a15948429b99dc8f700bb05efe6'
            'SKIP')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  ln -s qemu-launcher-32x32.xpm "$pkgdir"/usr/share/pixmaps/qemu-launcher.xpm
}
