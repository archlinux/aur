# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=dreamchess-music
pkgver=1.0
pkgrel=1
pkgdesc="Music Pack for DreamChess"
arch=('i686' 'x86_64')
url="http://www.dreamchess.org/"
license=('custom')
depends=('dreamchess')
source=($pkgname-$pkgver.run.tar.gz::http://sourceforge.net/projects/dreamchess/files/music/0.1/$pkgname-$pkgver.run.tar/download)

md5sums=('e05eb5a140acefc99b984868f1f13039')

build() {
  cd "$srcdir"
  ./$pkgname-$pkgver.run --noexec --keep --target $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/{dreamchess,licenses/$pkgname}
  cp -r data/music $pkgdir/usr/share/dreamchess/
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
