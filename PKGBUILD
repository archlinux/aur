# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.1.0.svn.r10109
_pkgver=1.1.0+svn10109+gited3de09bc-160.1
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

source=("https://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/Fedora_35/x86_64/${_pkgname}-gtk-${_pkgver}.x86_64.rpm")
sha512sums=('0f392439749be17f94959bb68840c2476a89bd3580ef277fd6df48829fb90628f34ecc37aadf656f76126b11ef4344d3c5cf833408eca000d4da1f017686831c')


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

