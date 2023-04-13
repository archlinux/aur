# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.1.0.svn.r10686
_pkgver=1.1.0+svn10686+gitc4a2d90-659.1
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

source=("https://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/Fedora_37/x86_64/${_pkgname}-gtk-${_pkgver}.x86_64.rpm")
sha512sums=('4c374a28b562e5b8b5f54608cb7bcc32b172aca2e9419bae83bb5d9014fd90a1d1ebb152b44df550f6446e0b8ffb9bea7c9fab5bb6d3ece47f946f5f88c32665')


prepare() {
  ln -sfn ../lib/doublecmd/doublecmd usr/bin/doublecmd
}

package() {
   install -dm755 "${pkgdir}/usr"
   #install -Dm755 "$srcdir/usr/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
   cp -a usr/bin   "${pkgdir}/usr/"
   cp -a usr/share "${pkgdir}/usr/"
   cp -a usr/lib64 "${pkgdir}/usr/lib"
}
