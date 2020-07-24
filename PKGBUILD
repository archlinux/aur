# Maintainer: Arthorius <Arthcomicando@gmail.com>

pkgname=octanebench
pkgver=4.0
pkgrel=2
pkgdesc="OctaneBench allows you to benchmark your GPU using OctaneRender. requires NVIDIA driver 419.17 or higher"
arch=(x86_64)
url="https://render.otoy.com/octanebench"
license=('GPL')
makedepends=('p7zip')
source=("https://render.otoy.com/downloads/a/787/59ea3438-034b-4081-ad21-6174e7614886/${pkgname}_4_00c_linux.zip"
	"${pkgname}.desktop"
	"${pkgname}.png")
md5sums=('97a690a215f993d72101de0e4e6e687c'
         '9476a0cc644ad2a4a54c9310acc4e039'
         '8e94c5725ab1affa51011c5c4aecbc1b')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	install -Dm 0644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 0744 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"	
	cd "${pkgname}_4_00c_linux"
	cp -rf "octane" "${pkgdir}/opt/${pkgname}/octane"
	cp -rf "octane.dat" "${pkgdir}/opt/${pkgname}/octane.dat"
	cp -rf "libfbxsdk.so" "${pkgdir}/opt/${pkgname}/libfbxsdk.so"
	cp -rf "benchmark_data/" "${pkgdir}/opt/${pkgname}/benchmark_data/"
	cp -rf "octanebench_readme.txt" "${pkgdir}/opt/${pkgname}/octanebench_readme.txt"
	ln -s "/opt/${pkgname}/octane" "${pkgdir}/usr/bin/OctaneBench"
}
