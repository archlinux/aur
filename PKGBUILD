# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=dex-icon-theme
pkgver=0.4
pkgrel=1
pkgdesc="Samsung Galaxy S8 like icon theme for KDE"
url="https://store.kde.org/p/1197856/"
arch=('any')
license=('LGPL3')
depends=('breeze-icons')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1511567286/Dex_KDE.tar.gz")
sha256sums=('9a0e57ec4fd594ad866b0f288b01e889ffe2a237a2efe9b2f602f656072abcff')

package() {
  rm ./Dex*/{AUTHORS,LICENSE}
  find -type f -name '* *' -delete
  find -type f -name '.directory' -delete
  find -type d -name 'New Folder' -delete
  install -d "$pkgdir/usr/share/icons"
  mv Dex* "$pkgdir/usr/share/icons/"
}
