# Maintainer: Clement Poisson <clement@poisson.me>
pkgname=kx3util
pkgver=1.23.4.23
pkgrel=1
epoch=
pkgdesc="Elecraft KX3 Utility"
arch=("x86_64")
url="https://elecraft.com/pages/kx3-high-perofrmance-portable-transceiver-firmware-and-utility"
license=("custom")
groups=()
depends=("lib32-glibc" "lib32-libstdc++5" "lib32-gtk2" "curl")
makedepends=()
checkdepends=()
optdepends=()
provides=('kx3util')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://ftp.elecraft.com/KX3/Utilities/KX3UtilityLINUX64BIT_1_23_4_23.tar.gz")
noextract=()
md5sums=('f46a2786b81bcb82d874c9e5c00427ac')
validpgpkeys=()

package() {

	# Desktop Entry
	install -Dm644 ../kx3util.desktop "${pkgdir}/usr/share/applications/kx3util.desktop"

	# License
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Alias executable
	install -Dm755 ../kx3util "${pkgdir}/usr/local/bin/kx3util"

	cd "${srcdir}/KX3UtilityLINUX64BIT_1_23_4_23"

	# Main Contents
	install -d "${pkgdir}/usr/local/etc/${pkgname}"
	install -Dm755 kx3util "${pkgdir}/usr/local/etc/${pkgname}/kx3util"

	# Libraries
	cp -r "Libs" "${pkgdir}/usr/local/etc/${pkgname}"
	cp -r "Help" "${pkgdir}/usr/local/etc/${pkgname}"
	cp -r "Resources" "${pkgdir}/usr/local/etc/${pkgname}"
}
