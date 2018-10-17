# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rdpsign
pkgver=r7.g89cd086
pkgrel=1
pkgdesc="Remote Desktop Protocol (.rdp) file signing"
arch=(any)
url=https://github.com/nfedera/rdpsign
license=(Apache)
depends=(openssl)
source=("git+https://github.com/nfedera/rdpsign")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

package() {
	cd $pkgname
	install -D -m 0755 rdpsign.py "$pkgdir"/usr/bin/rdpsign
}
