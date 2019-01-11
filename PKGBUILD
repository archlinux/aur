# Maintainer: João Pinto <jpinto@ccsint.eu>
pkgname=linuxkit
pkgver=0.0.1.git.20190111
pkgrel=1
_commit=eb7e07542f839961b4611ee10f86f524ec9c39e9
epoch=
pkgdesc="A toolkit for building secure, portable and lean operating systems for containers"
arch=('x86_64')
url="https://github.com/linuxkit/linuxkit"
license=('APACHE')
groups=()
depends=()
makedepends=('git'
	'docker')
source=("git+https://github.com/linuxkit/linuxkit.git#commit=$_commit")

sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"
	#cd "$pkgname-$pkgver"
	make
}

#check() {
#}

package() {
	#cd "$pkgname-$pkgver"
	cd "${srcdir}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"	
	install -Dm755  bin/linuxkit "${pkgdir}/usr/bin"
	install -Dm755  bin/rtf "${pkgdir}/usr/bin"
}
