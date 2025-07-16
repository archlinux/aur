# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='folsy'
pkgver='25.7'
_commit='cdcde50e436eb2c59eb6edc11cc0635ec5250509'
pkgrel=1
pkgdesc="folder synchronization in POSIX sh"
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL-3.0-or-later')
depends=('findutils' 'grep' 'rsync' 'sed')
optdepends=('openssh: ssh support')
makedepends=('git')
install="$pkgname.install"
source=("git+${url}.git#commit=${_commit}")
sha256sums=('89e61c93f950b6bfcba7d9ca4c49d02111ae71b0964af29454222256fef38a40')

package() {
	cd "$srcdir/${pkgname}"
	install -pDm755 folsy "$pkgdir/usr/bin/folsy"
	install -pDm644 folsy-manual.txt "$pkgdir/usr/share/doc/folsy/folsy-manual.txt"
}
