# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=dex-icon-theme
pkgver=0.5
pkgrel=1
pkgdesc="Samsung Galaxy S8 like icon theme for KDE"
url="https://store.kde.org/p/1197856/"
arch=('any')
license=('LGPL3')
depends=('breeze-icons')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1512168280/s/cd5638d28fe1577ba10fcbadb1df67fa/t/1519222259/u//kde.tar.gz")
sha256sums=('20312b445d3ccfc818743bb00e1507972b1e0ef9d03a02fbe47b533e82c84477')

package() {
  rm ./Dex*/{AUTHORS,LICENSE}
  find -type f -name '* *' -delete
  find -type f -name '.directory' -delete
  find -type d -name 'New Folder' -delete
  install -d "$pkgdir/usr/share/icons"
  mv Dex* "$pkgdir/usr/share/icons/"
}
