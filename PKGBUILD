# Maintainer: robertfoster

pkgname=ibm-sw-tpm2
pkgver=1332
pkgrel=1
pkgdesc="An implementation of the TCG TPM 2.0 specification by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmswtpm2/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/project/ibmswtpm2/ibmtpm$pkgver.tar.gz"
tpm_server.service)

build() {
    cd $srcdir
    cd src
    make -f makefile
}

package() {
    cd $srcdir/
    install -Dm755 src/tpm_server $pkgdir/usr/bin/tpm_server
    install -Dm644 tpm_server.service $pkgdir/usr/lib/systemd/system/tpm_server.service
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('0ab34a655b4e09812d7ada19746af4f9'
'f89df46f8b71febafbf386e13553156b')
