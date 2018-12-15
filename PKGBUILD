# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli
pkgver=1.2
pkgrel=4
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
source=("https://code.as/writeas/writeas-cli/archive/v${pkgver}.tar.gz")
sha256sums=('9c1a352000770c78005af78e698a89bf70951151b0231c81219778a2b483bd30')

prepare() {
	cd ${pkgname}
	rm -f go.mod
	go mod init github.com/writeas/writeas-cli
}

build() {
	cd ${pkgname}
	go build ./cmd/writeas/
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/writeas" "${pkgdir}/usr/bin/writeas"
}
