# Maintainer: Eduard Toloza edu4rdshl@securityhacklabs.net

pkgname=upcheck
pkgver=0.1.0
pkgrel=2
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url="https://gitlab.com/edu4rdshl/upcheck"
license=('GPL3')
depends=('pacman-contrib')
source=("https://gitlab.com/edu4rdshl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "$pkgname.install")
sha512sums=('1c33f8b005b19ed2c0ef6229cafe3aec348a1b1a6d24057eae71ffe6c4e180f33975a84d4c8293f3f8291bd8817a03003c712ba3062c99375e8703023dcb9c86'
            'SKIP')
install="$pkgname.install"

package() {
  cd $pkgname-$pkgver
  install -dm 755 "$pkgdir/etc/systemd/system/"

  install -Dm 755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 755 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  cp $pkgname.{service,timer} "$pkgdir/etc/systemd/system/"
}
