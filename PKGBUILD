# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeff Labonte jeff.labonte12@gmail.com
pkgname=evelauncher
pkgver=1104891
pkgrel=1
epoch=
pkgdesc="Unofficial Eve Online Launcher. Simplify Installation"
arch=('any')
url="https://binaries.eveonline.com/evelauncher-1104891.tar.gz"
license=('custom')
groups=()
depends=('wine')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://binaries.eveonline.com/evelauncher-1104891.tar.gz"
	"evelauncher.desktop"
	"icon.png")
noextract=()
md5sums=(
	'a99e75f1de68531f86f52b30ea4ee2cd'
	'd6d1437552264f74f64a745d9a3c9d3f'
	'37c1b0799f8e671b298c288d900dd7f0'
)

package() {
	# Install the main files.
  	install -d "${pkgdir}/opt/${pkgname}"
  	cp -a "${srcdir}/evelauncher/." "${pkgdir}/opt/${pkgname}"
	# Exec bit
  	chmod 755 "${pkgdir}/opt/${pkgname}/evelauncher"


  	# Desktop Entry
  	install -d "${pkgdir}/usr/share/applications"
  	install "${srcdir}/evelauncher.desktop" "${pkgdir}/usr/share/applications"
	
	install -d "${pkgdir}/opt/${pkgname}"
	install "${srcdir}/icon.png" "${pkgdir}/opt/${pkgname}"	
	
  	# Main binary
 	install -d "${pkgdir}/usr/bin"
 	ln -s "/opt/${pkgname}/evelauncher" "${pkgdir}/usr/bin/${pkgname}"
}
