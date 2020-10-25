# Maintainer: João Pinto <jpinto@ccsint.eu>
pkgname=linuxkit
pkgver=0.8
pkgrel=1
epoch=
pkgdesc="A toolkit for building secure, portable and lean operating systems for containers"
arch=('x86_64')
url="https://github.com/linuxkit/linuxkit"
license=('APACHE')
groups=()
depends=()
checkdepends=()
makedepends=('git' 'docker' 'make')
conflicts=('linuxkit-git')
source=("https://github.com/linuxkit/linuxkit/archive/v${pkgver}.tar.gz")

sha256sums=('70aeb7f8cb0d84a57f615ed1f262427ce314296f92436b5b584f2f0502f765f5')

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"
	make VERSION=v${pkgver}
}

#check() {
#	cd "${srcdir}/${pkgname}"
#	make test
#}

package() {
	cd "${srcdir}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755  bin/linuxkit "${pkgdir}/usr/bin"
	install -Dm755  bin/rtf "${pkgdir}/usr/bin"
}
