# Maintainer: Nemanja Nedeljkovic <nemanjan00@gmail.com>

pkgname=teamsql
pkgver=1.0.108
pkgrel=2
pkgdesc="Multi-Platform SQL Client"
arch=('x86_64')
license=()
depends=("libappindicator" "libnotify" "gconf")
optdepends=()
options=()
install=$pkgname.install
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb"
        'teamsql.sh')
md5sums=('a474ce38b9f6bf5b311f8fc7c0a588a5'
         '7262cf67a1e2634401d6012d8d34e7d8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  # Launcher
  install -Dm 755 teamsql.sh "$pkgdir"/usr/bin/teamsql
}
