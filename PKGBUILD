# Contributor: Jan Fader <jan.fader@web.de>
pkgname=mp3rename
pkgver=0.6.9
pkgrel=4
pkgdesc="mp3rename renames mp3-files according id3-infos"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/unstable/sound/mp3rename"
install=
source=(http://ftp.debian.org/debian/pool/main/m/mp3rename/mp3rename_0.6.orig.tar.gz
combined-mp3rename_0.6.9-and-jf-archlinux-and-jf-manpage-and-jf-padnumbers.diff
mp3rename-jf-long-options.patch
)

build() {
  cd $srcdir/$pkgname-0.6.orig
  patch -i ../combined-mp3rename_0.6.9-and-jf-archlinux-and-jf-manpage-and-jf-padnumbers.diff
  patch -i ../mp3rename-jf-long-options.patch
  make || return 1
  gzip mp3rename.1
}
package() {
  cd $srcdir/$pkgname-0.6.orig
  export PREFIX=$pkgdir; make install
}
md5sums=('c3c3dff9ed533103eede86fbce75a7b1'
         'b11dc25c5af85f159680ed8401017445'
         '695bc74356443fb4090585f9bcdf390a')
