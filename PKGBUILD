# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: slubman <slubman@slubman.net>

pkgname=tktheme
pkgver=0.23
pkgrel=9
pkgdesc="A library to allow Tkabber docking in the system tray."
arch=('x86_64')
depends=('tk' 'libxpm' 'libxmu')
license=("GPL")
source=(http://tkabber.jabber.ru/files/other/Tk_Theme-23.tgz)
url="http://tkabber.jabber.ru"
md5sums=('121c335e3b3764cbd04eea68b6a66dd3')

build() {
  cd "$srcdir"/Tk_Theme-23
  tclsh configure
  make
}

package() {
  cd "$srcdir"/Tk_Theme-23
  mkdir -p "$pkgdir"/usr/lib/tktheme
  cp theme.so "$pkgdir"/usr/lib/tktheme/
  cp pkgIndex.tcl "$pkgdir"/usr/lib/tktheme/
  sed -i 's|ifneeded Tk_Theme 20|ifneeded Tk_Theme 23|' "$pkgdir"/usr/lib/tktheme/pkgIndex.tcl
}
