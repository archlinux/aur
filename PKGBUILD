# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.9.3
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
#groups=()
depends=('jre11-openjdk' 'java11-openjfx>=11.0.10.u1' 'fontconfig' 'chromaprint')
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
md5sums=('fece1d4286165758b90b935802121c80'
         '9b7ba1e301b3f4c8b9a751d6a00414ea')
#validpgpkeys=()

#prepare() {}

#build() {}

#check() {}

package() {
  mkdir -p $pkgdir/usr/bin
  # mkdir -p $pkgdir/usr/share/$pkgname/openjfx
  mkdir -p $pkgdir/usr/share/$pkgname
 
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"

  cd $srcdir
  
  cp -dpr --no-preserve=ownership * "$pkgdir"
  
  # ln -sf $srcdir/usr/share/$pkgname/bin/$pkgname.sh $pkgdir/usr/bin/$pkgname

}
