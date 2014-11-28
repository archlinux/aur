# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=wings2-musicpack
pkgver=1.0
pkgrel=3
pkgdesc="Music pack for the wings2 game."
arch=('i686' 'x86_64')
url="http://www.wings2.net/"
license=('custom')
depends=('wings2>=1.3.0')
makedepends=('unzip')
source=(http://www.wings2.net/util/download_music.php?file=Complete_Wings2_Music_Pack.zip)

md5sums=('74399ee341e501a7f81622d46267ee13')

build() {
  cd "$startdir/src"

  install -d "$startdir/pkg/opt/Wings2/music"
  cp -r $startdir/src/* $startdir/pkg/opt/Wings2/music || return 1
  rm $startdir/pkg/opt/Wings2/music/*.zip || return 1

#remove unneeded playlist and music files
   rm "$startdir/pkg/opt/Wings2/music/menu_music.txt" || return 1

   rm $startdir/pkg/opt/Wings2/music/Arto*.ogg || return 1
   rm $startdir/pkg/opt/Wings2/music/*Dimension.ogg || return 1
   rm $startdir/pkg/opt/Wings2/music/*"Wings of Journey"*.ogg || return 1

#right file/folder permissions
  find $startdir/pkg/opt -type d -exec chmod 755 "{}" \; || return 1
  find $startdir/pkg/opt -type f -exec chmod 644 "{}" \; || return 1
}
