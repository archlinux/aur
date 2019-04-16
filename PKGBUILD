# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.1.0
pkgrel=4
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic' 'papirus-icon-theme')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/releases/download/$pkgver/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('cd6f3d42cda88b395248c3278f3ed55c95219bed8eb97f03aa786c40c94ee56afa6f44ce457c0ee2428c3b4e11f0ad79a5167534013a1cf0807cb74747acb244')

prepare() {
  ln -s ../../../Papirus/22x22/apps/system-file-manager.svg Papirus-nordic/22x22/places/file-manager.svg
  ln -s ../../../Papirus/24x24/apps/system-file-manager.svg Papirus-nordic/24x24/places/file-manager.svg
  ln -s ../../../Papirus/32x32/apps/system-file-manager.svg Papirus-nordic/32x32/places/file-manager.svg
  ln -s ../../../Papirus/48x48/apps/system-file-manager.svg Papirus-nordic/48x48/places/file-manager.svg
  ln -s ../../../Papirus/64x64/apps/system-file-manager.svg Papirus-nordic/64x64/places/file-manager.svg

  ln -s ../../../Papirus/22x22/apps/system-file-manager.svg Papirus-nordic-folders/22x22/places/file-manager.svg
  ln -s ../../../Papirus/24x24/apps/system-file-manager.svg Papirus-nordic-folders/24x24/places/file-manager.svg
  ln -s ../../../Papirus/32x32/apps/system-file-manager.svg Papirus-nordic-folders/32x32/places/file-manager.svg
  ln -s ../../../Papirus/48x48/apps/system-file-manager.svg Papirus-nordic-folders/48x48/places/file-manager.svg
  ln -s ../../../Papirus/64x64/apps/system-file-manager.svg Papirus-nordic-folders/64x64/places/file-manager.svg

}

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
