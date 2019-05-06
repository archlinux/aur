# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=2.0
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/archive/v$pkgver.tar.gz?/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('391e4afa72cc5747caa3bff356dd9579afdc36630b7423e03d41617fb06a36928371152438018873e718b8a9d40bf71d295ab75624b229ea5de3c6f5e3c16e6a')


package() {
 cd papirus-folders-$pkgver/$pkgname

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/icons"

  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  cp -r Papirus-Dark-nordic Papirus-Light-nordic Papirus-nordic ePapirus-nordic $pkgdir/usr/share/icons/
  cp -r Papirus-Dark-nordic-folders Papirus-Light-nordic-folders Papirus-nordic-folders ePapirus-nordic-folders $pkgdir/usr/share/icons/

  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic/

  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic-folders/

}
