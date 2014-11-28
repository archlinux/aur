# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=wings2-levelpack
pkgver=1.0
pkgrel=3
pkgdesc="Level pack for the Wings2 game."
arch=('i686' 'x86_64')
url="http://www.wings2.net/"
license=('custom')
depends=('wings2>=1.3.0')
makedepends=('unzip')
source=(http://www.wings2.net/util/download_levels.php?file=Wings2_Level_Collection_v1.zip)

md5sums=('d38aa08efefff60f1af9a5b656118475')

build() {
  cd "$startdir/src"

  install -d "$startdir/pkg/opt/Wings2/levels"
  cp -r $startdir/src/* $startdir/pkg/opt/Wings2/levels || return 1
  rm $startdir/pkg/opt/Wings2/levels/*.zip || return 1

#remove unneeded level files
  rm "$startdir/pkg/opt/Wings2/levels/africa.lev" || return 1
  rm "$startdir/pkg/opt/Wings2/levels/cerulean.lev" || return 1
  rm "$startdir/pkg/opt/Wings2/levels/frozen.lev" || return 1
  rm "$startdir/pkg/opt/Wings2/levels/furious.lev" || return 1
  rm "$startdir/pkg/opt/Wings2/levels/stones_n_shit.lev" || return 1

#right permissions
  find $startdir/pkg/opt -type d -exec chmod 755 "{}" \; || return 1
  find $startdir/pkg/opt -type f -exec chmod 644 "{}" \; || return 1
}
