# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.9.2
pkgrel=5
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
#groups=()
depends=('jre11-openjdk' 'java11-openjfx' 'fontconfig' 'chromaprint')
makedepends=()
checkdepends=()

optdepends=('libzen: Required by libmediainfo'
            'libmediainfo: Read media info such as video codec, resolution or duration'
            'gvfs: Drag-n-Drop from GVFS remote filesystems')

provides=('filebot')

conflicts=('filebot47' 'filebot-git')
#replaces=()
#backup=()
#options=()
install=$pkgname.install
#changelog=
source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz"
         "filebot.sh")

#noextract=()
md5sums=('8417980b971ad2099066216b815f50af'
         'e63065c98d9e55ceaf233fc8bc8d48f7')
#validpgpkeys=()

#prepare() {}

#build() {}

#check() {}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/$pkgname/openjfx
 
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"

  cd $srcdir
  
  cp -dpr --no-preserve=ownership * "$pkgdir"
  
  # ln -sf $srcdir/usr/share/$pkgname/bin/$pkgname.sh $pkgdir/usr/bin/$pkgname

}
