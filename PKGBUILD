# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

pkgname=viper-sh
pkgver=1.0.2
pkgrel=2
pkgdesc="A Bourne Shell, CLI only, Northstar updater and mod manager"
arch=('any')
url="https://github.com/0neGal/viper-sh"
license=('GPL3')
provides=($pkgname)
conflicts=($pkgname)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a19871ff450f2ae3d1d69b93a16126bf7c4df8dadc27e842209b409fef128304')

prepare() {
  echo "Rename viper-sh to vipersh"
  cd $pkgname-$pkgver
  mv $pkgname vipersh
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 vipersh -t "$pkgdir/usr/bin"
}
