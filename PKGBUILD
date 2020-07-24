# Maintainer: Arthorius <Arthcomicando@gmail.com>

pkgname=octane-bench
_pkgname=octanebench
pkgver=4.0
pkgrel=2
pkgdesc="OctaneBench allows you to benchmark your GPU using OctaneRender. requires NVIDIA driver 419.17 or higher"
arch=(x86_64)
url="https://render.otoy.com/octanebench"
license=('GPL')
makedepends=('p7zip')
source=("https://render.otoy.com/downloads/a/787/59ea3438-034b-4081-ad21-6174e7614886/OctaneBench_4_00c_linux.zip"
	"${_pkgname}.desktop"
	"${_pkgname}.png")
md5sums=('714ba23bc129f7734385e168afb149b0'
         '9476a0cc644ad2a4a54c9310acc4e039'
         '8e94c5725ab1affa51011c5c4aecbc1b')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${_pkgname}"
	install -Dm 0644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm 0744 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"	
	cd "OctaneBench_4_00c_linux"
	cp -rf "octane" "${pkgdir}/opt/${_pkgname}/octane"
	cp -rf "octane.dat" "${pkgdir}/opt/${_pkgname}/octane.dat"
	cp -rf "libfbxsdk.so" "${pkgdir}/opt/${_pkgname}/libfbxsdk.so"
	cp -rf "benchmark_data/" "${pkgdir}/opt/${_pkgname}/benchmark_data/"
	cp -rf "octanebench_readme.txt" "${pkgdir}/opt/${_pkgname}/octanebench_readme.txt"
	ln -s "/opt/${_pkgname}/octane" "${pkgdir}/usr/bin/OctaneBench"
}
