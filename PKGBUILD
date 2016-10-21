# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: Chris Warner <inhies@gmail.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Ju <ju@heisec.de>
pkgname=chkboot
pkgver=1.2
pkgrel=2
pkgdesc="Create hashes of all files under /boot and warns the user if they are modified"
arch=('any')
url="https://github.com/grazzolini/chkboot"
license=('GPL')
depends=('bash')
makedepends=()
checkdepends=()
optdepends=('zenity: Graphical notifications'
            'xorg-xmessage: Graphical notifications')
backup=('etc/default/chkboot.conf')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('91a2ab434e43ef0c577f1a6c55ee376f6466b2da9ff0ea81bb63f4ede3bcf7b24bcd5a594f059a5916e5cee4c7cf0e746a499a3c9afee9e72df02aeee824a32d')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.conf"                "$pkgdir/etc/default/chkboot.conf"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-profilealert.sh"     "$pkgdir/etc/profile.d/chkboot-profilealert.sh"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot"      		"$pkgdir/usr/bin/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-check"      		"$pkgdir/usr/bin/chkboot-check"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-desktopalert"        "$pkgdir/usr/bin/chkboot-desktopalert"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot-initcpio"   		"$pkgdir/usr/lib/initcpio/install/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-bootcheck" 		"$pkgdir/usr/lib/systemd/scripts/chkboot-bootcheck"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.service" 		"$pkgdir/usr/lib/systemd/system/chkboot.service"
}
