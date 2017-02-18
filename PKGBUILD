# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluser
pkgver=1.471
pkgrel=1
pkgdesc="A small and well balanced GM/GS soundbank for many styles of music."
arch=('any')
license=("custom")
url="http://www.schristiancollins.com/generaluser.php"
groups=('soundfonts')
#source=("http://www.schristiancollins.com/soundfonts/GeneralUser_GS_$pkgver-FluidSynth.zip")
source=("https://dl.dropboxusercontent.com/u/8126161/GeneralUser_GS_$pkgver.zip")
md5sums=('5eaa95224f6080864cf6aedc1c9820a6')

package() {
  cd "GeneralUser GS $pkgver"
  install -Dm644 "GeneralUser GS v$pkgver.sf2" "$pkgdir/usr/share/soundfonts/GeneralUser.sf2"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/$pkgname/lists"
  find "instrument lists/"* -type f -exec chmod -x {} \;
  cp -r "instrument lists/"* "$pkgdir/usr/share/$pkgname/lists"
}

