# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse <windows2linux@zoho.com>

pkgname=elementary-xfce-icons
_pkgname=elementary-xfce
pkgver=0.5
pkgrel=4
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
sha256sums=('174ec646ae16560a5a58a34d03f7f96cee2f586cb3563c90009bed87c1cb913e')

package() {
  cd ${pkgname%-*}-$pkgver

  install -d "$pkgdir/usr/share/icons"
  cp -r ${_pkgname}{,-dark} "$pkgdir/usr/share/icons"

  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
