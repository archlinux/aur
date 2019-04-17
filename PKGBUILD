# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.1.1
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic' 'papirus-icon-theme')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/releases/download/v$pkgver/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('131DBACAEA0CE1AC1F00EFE659F532AB7B63DFCD97D2FC3669C176BDACB5A006E76C493AB4B8CBB374274F5B7B44745F58F2C197597C50D9DF14F5EDC1C00AA5')


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
