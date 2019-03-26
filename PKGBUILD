# Maintainer: Eduard Toloza edu4rdshl@securityhacklabs.net

pkgname=upcheck
pkgver=0.1.0
pkgrel=1
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url="https://gitlab.com/edu4rdshl/upcheck"
license=('GPL3')
depends=('pacman-contrib')
source=("https://gitlab.com/edu4rdshl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "$pkgname.install")
sha256sums=('299F590D967CD98A1E658D6CD4226B1D37B9A5DFF8CABBB5D00BC09072D61C28'
            'SKIP')
install="$pkgname.install"

package() {
  cd $pkgname-$pkgver
  install -dm 755 "$pkgdir/etc/systemd/system/"

  install -Dm 755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 755 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  cp $pkgname.{service,timer} "$pkgdir/etc/systemd/system/"
}
