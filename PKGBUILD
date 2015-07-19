# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse <windows2linux@zoho.com>

pkgname=elementary-xfce-icons
_pkgname=elementary-xfce
pkgver=0.6
pkgrel=1
pkgdesc='Elementary icons forked, extended and maintained for Xfce.'
arch=(any)
url=https://github.com/shimmerproject/elementary-xfce
license=(GPL2)
depends=(gnome-icon-theme)
options=(!strip)
conflicts=($pkgname-git)
optdepends=('xfce-theme-albatross: matching Shimmer Project Xfce theme'
            'xfce-theme-bluebird: matching Shimmer Project Xfce theme'
            'xfce-theme-greybird: matching Shimmer Project Xfce theme')
source=($pkgname-$pkgver.tar.gz::https://github.com/shimmerproject/${pkgname%-*}/archive/v$pkgver.tar.gz)
source=("https://github.com/shimmerproject/$_pkgname/archive/v$pkgver.zip")
sha256sums=('b3ddf9703c825a5a4d7ee58f9b2ab2e4442f10b8546c5c1a556fb14a834bddf1')

package() {
  cd ${pkgname%-*}-$pkgver

  install -d "$pkgdir/usr/share/icons"
  cp -r ${_pkgname}{,-dark} "$pkgdir/usr/share/icons"

  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
