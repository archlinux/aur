# Maintainer: Eduard Toloza edu4rdshl@securityhacklabs.net

pkgname=upcheck
pkgver=0.1.1
pkgrel=1
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url="https://gitlab.com/edu4rdshl/upcheck"
license=('GPL3')
depends=('pacman-contrib')
source=("https://gitlab.com/edu4rdshl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "$pkgname.install")
sha512sums=('208443c757528396e82980bf31654f5d1802abcd090422a2ceff7bfbfb512e5173f20e5eca5f0d53b8e38c747b1909940d69970e61b5f894923b02f0cf16b948'
            'SKIP')
install="$pkgname.install"

package() {
  cd $pkgname-$pkgver
  install -dm 755 "$pkgdir/usr/lib/systemd/user/"

  install -Dm 755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 755 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  cp $pkgname.{service,timer} "$pkgdir/usr/lib/systemd/user/"
}
