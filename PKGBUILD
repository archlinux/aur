#Maintainer: serf dot jp at gmail dot com
pkgname="edcas-client-bin"
_pkgname="edcas-client"
pkgver="0.3.0"
pkgrel="3"
pkgdesc="Elite Dangerous Commander Assistant System. Shows system information compact for explorer."
url="https://github.com/arne-fuchs/edcas-client"

arch=("x86_64")
depends=("gcc-libs" "glibc" "openssl" "binutils")
#optdepends=()
#conflicts=()

license=("Apache")
source=("$url/releases/download/$pkgver/edcas-client-linux.tar.gz")
md5sums=("SKIP")

prepare() {
	cd "${srcdir}"
	tar xvzf edcas-client-linux.tar.gz
	cd $_pkgname
}

package() {
	cd $_pkgname
	install -Dm755 edcas-client "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 settings-example.json "${pkgdir}/etc/$_pkgname/settings-example.json"
	install -Dm644 materials.json "${pkgdir}/usr/share/$_pkgname/materials.json"
}
