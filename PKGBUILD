# Maintainer: robertfoster

pkgname=ibm-sw-tpm2
pkgver=1119
pkgrel=2
pkgdesc="An implementation of the TCG TPM 2.0 specification by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmswtpm2/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/project/ibmswtpm2/ibmtpm$pkgver.tar.gz"
tpm2_server.service)

build() {
	cd $srcdir
	cd src
	make -f makefile
}

package() {
	cd $srcdir/
	install -Dm755 src/tpm_server $pkgdir/usr/bin/tpm2_server
	install -Dm644 tpm2_server.service $pkgdir/usr/lib/systemd/system/tpm2_server.service
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('cf20b9080b4692984c8389c5052fe68a'
'23239f55ca9fe6522844bc425dcfe2ef')
