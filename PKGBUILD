# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mark Coolen <mark.coolen@gmail.com>

pkgname=berusky2-data
pkgver=0.9
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban - Data"
arch=('any')
url="http://www.anakreon.cz/en/"
license=('GPL')
#source=("http://www.anakreon.cz/download/$pkgname-$pkgver.tar.gz")
source=("http://downloads.sourceforge.net/project/berusky2/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('b0d472dfb6c64c00f777d30427ed728d')

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  mkdir -p "$pkgdir"/usr/share/berusky2/
  #cp -r {bitmap,data,game_data,materials,textures,game,items,out,Save} "$pkgdir"/usr/share/berusky2
  
  install -m 755 -d "$pkgdir"/usr/share/berusky2
  #install -m 644 -t "$pkgdir"/usr/share/berusky2/ berusky3d-local.ini
  install -m 755 -d "$pkgdir"/usr/share/berusky2/game
  for s in `ls game`;do
    install -m 755 -d "$pkgdir"/usr/share/berusky2/game/$s
    install -m 644 -t "$pkgdir"/usr/share/berusky2/game/$s game/$s/*
  done
  for s in bitmap data game_data materials textures items out music sound;do
     install -m 755 -d "$pkgdir"/usr/share/berusky2/$s
     install -m 644 -t "$pkgdir"/usr/share/berusky2/$s $s/*
  done
  install -m 755 -d "$pkgdir"/usr/share/berusky2/Save/profiles
  #install -m 644 -d "$pkgdir"/var/games/berusky2
  #ln -s "$pkgdir"/usr/share/berusky2/berusky3d.ini "$pkgdir"/var/games/berusky2/berusky3d.ini
  #rm "$pkgdir"/usr/share/berusky2/*.spec
}
