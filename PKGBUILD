# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.1.0
pkgrel=3
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic' 'papirus-icon-theme')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/releases/download/$pkgver/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('cd6f3d42cda88b395248c3278f3ed55c95219bed8eb97f03aa786c40c94ee56afa6f44ce457c0ee2428c3b4e11f0ad79a5167534013a1cf0807cb74747acb244')

package() {
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
