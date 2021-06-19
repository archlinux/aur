# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.0.0.svn.r9830
_pkgver=1.0.0+svn9830+gitbe799e0f5-220
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
sha512sums=('598aa072a18a16b86465b111173855c4b1f32507462b49c9bb85d3c2eec865a180361daa660090e4a473de95a646e19339054c16aafd7849a965a016b8561320')


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

