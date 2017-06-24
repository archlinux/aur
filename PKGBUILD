# Maintainer: Nemanja Nedeljkovic <nemanjan00@gmail.com>

pkgname=teamsql
pkgver=0.9.106
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
arch=('x86_64')
license=()
depends=("libappindicator" "libnotify")
optdepends=()
options=()
install=$pkgname.install
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb"
        'teamsql.sh')
md5sums=('f7e715c97a4a03414cf580ac781f7b3d'
         '7262cf67a1e2634401d6012d8d34e7d8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  # Launcher
  install -Dm 755 teamsql.sh "$pkgdir"/usr/bin/teamsql
}
