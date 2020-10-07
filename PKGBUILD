# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.9.2
pkgrel=3
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
#groups=()
depends=('liberica-jre-11-full-bin' 'fontconfig' 'chromaprint')
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
source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz")

#noextract=()
md5sums=('8417980b971ad2099066216b815f50af')
#validpgpkeys=()

#prepare() {}

#build() {}

#check() {}

package() {
  mkdir -p $pkgdir/usr/bin

  cd $srcdir

  # install -Dm755 usr/share/filebot/bin/$pkgname.sh "$pkgdir/usr/bin/$pkgname"
  # chmod +x usr/share/filebot/bin/$pkgname.sh
  # cp -dp -s /usr/share/filebot/bin/$pkgname.sh $pkgdir/usr/bin/$pkgname
  
  cp -dpr --no-preserve=ownership * "$pkgdir"
  
  ln -sf $srcdir/usr/share/$pkgname/bin/$pkgname.sh $pkgdir/usr/bin/$pkgname

  # chmod +x usr/share/filebot/bin/$pkgname.sh
  # cp -dp -s /usr/share/filebot/bin/$pkgname.sh $pkgdir/usr/bin/$pkgname

}
