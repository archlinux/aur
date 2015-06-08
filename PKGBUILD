# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: Chris Warner <inhies@gmail.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Ju <ju@heisec.de>
pkgname=chkboot
pkgver=1.1
pkgrel=1
pkgdesc="Create hashes of all files under /boot and warns the user if they are modified"
arch=('any')
url="https://github.com/grazzolini/chkboot"
license=('GPL')
depends=('bash')
makedepends=()
checkdepends=()
optdepends=()
provides=('chkboot-git')
conflicts=('chkboot-git')
replaces=('chkboot-git')
backup=('etc/default/chkboot.conf')
install=$pkgname.install
source=("$pkgname.install"
	"$url/archive/v$pkgver.tar.gz")
sha512sums=('686bbf16b8bcf5755f7f5efde865fbfeecbe9a579490dccef8577b4d97ffd99bb78f9e4d0e87b107d4cc05da54f1000de4ef15dbb571993cf5a8d3d115d7f5b3'
            '3102032a98fe7b4bc5e9da5b4bb9e07818850ce553393b78b3e2b39a65d28dd65c2dd5194e8c563d804317b61d32b05775e883581593b7246e9be3c79e07b52f')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.conf"			"$pkgdir/etc/default/chkboot.conf"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-profilealert.sh"      "$pkgdir/etc/profile.d/chkboot-profilealert.sh"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot"      		"$pkgdir/usr/bin/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-check"      		"$pkgdir/usr/bin/chkboot-check"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot-initcpio"   		"$pkgdir/usr/lib/initcpio/install/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-bootcheck" 		"$pkgdir/usr/lib/systemd/scripts/chkboot-bootcheck"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.service" 		"$pkgdir/usr/lib/systemd/system/chkboot.service"
}
