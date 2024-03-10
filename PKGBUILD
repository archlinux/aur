# -------------------------------------------------------------------------
# This package contains two scripts which work together:
# 
# a UDisks wrapper: udisksvm 
# 
# It is generally run in the backgroud when a window manager starts,
# and wait for USB devices being plugged in, or a CD/DVD being inserted
# -------------------------------------------------------------------------
# a systray GUI utility: traydvm 
# 
# It is called by udisksvm when a device is plugged in, or a CD/DVD inserted
# and shows an icon in the system tray, featuring a right-click menu
# -------------------------------------------------------------------------
# INFOS ABOUT THE SCRIPTS ARE GIVEN IN: /usr/share/udisksvm/README
# -------------------------------------------------------------------------
# 
# Maintainer: Bernard Baeyens (berbae)  <berbae52 at sfr dot fr>
pkgname=udisksvm
pkgver=2.6.4
pkgrel=1
pkgdesc="GUI UDisks wrapper for removable media"
arch=('any')
url='https://bbs.archlinux.org/viewtopic.php?id=112397'
license=('GPL')
depends=('udisks2' 'python-gobject' 'python-pyqt6' 'oxygen-icons')
install=udisksvm.install
changelog=ChangeLog
source=("https://github.com/berbae/udisksvm/raw/master/$pkgname-$pkgver.tar.gz")

sha256sums=('c881d051f53407a4330a0a7b82ff228301486e6e2f4094dc31fff477e97a6a96')

package() {
  cd $srcdir
  install -D -m 644 README ${pkgdir}/usr/share/udisksvm/README
  install -D traydvm ${pkgdir}/usr/bin/traydvm
  install -D udisksvm ${pkgdir}/usr/bin/udisksvm
}

# vim:set ts=2 sw=2 et:
