# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.0.0.svn.r9831
_pkgver=1.0.0+svn9831+git4b2030e61-221
pkgrel=1
pkgdesc="A file manager with two panels side by side"
arch=('x86_64')
url='https://doublecmd.sourceforge.io'
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view' 'ffmpegthumbnailer: video thumbnails')
provides=('doublecmd')
replaces=('doublecmd-gtk2-bin-nightly')
conflicts=('doublecmd-gtk2' 'doublecmd-qt5-svn' 'doublecmd-qt5' 'doublecmd-gtk2-svn' 'doublecmd-gtk2-bin-nightly')
license=('GPL2')
options=('!strip')

source=("https://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/openSUSE_Tumbleweed/x86_64/${_pkgname}-gtk-${_pkgver}.1.x86_64.rpm")
sha512sums=('1f4e87036c00e0d6b4281a291e80c56d40042d341baf8ee9c96009f45818f3339db1c641575f2969a3e9aa4c66267ca85c644e3fdb4a379c78d04d0bca6005b6')


prepare() {
  ln -sfn ../lib/doublecmd/doublecmd usr/bin/doublecmd
}

package() {
   install -dm755 "$pkgdir/usr"
   #install -Dm755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
   cp -a usr/bin   "$pkgdir/usr/"
   cp -a usr/share "$pkgdir/usr/"
   cp -a usr/lib64 "$pkgdir/usr/lib"
}

