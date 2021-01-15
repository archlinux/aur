pkgname=gnotepad
pkgver=0.2
pkgrel=1
pkgdesc="A simple GTK Notepad"
arch=('x86_64')
url="https://github.com/caverym/gnotepad"
license=('GPL2')
depends=('gtk3')
makedepends=('git')

source=("git+https://github.com/caverym/gnotepad.git")
sha256sums=('SKIP')

build() {
	cd $pkgname
	make
}

package() {
	#mkdir -p "${pkgdir}/usr/bin"
	#mkdir -p "${pkgdir}/usr/share/applications/"
	#mkdir -p "${pkgdir}/usr/share/licenses/"

	install -Dm 755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 642 "${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
