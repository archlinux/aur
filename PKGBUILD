pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-cs")
provides=("${pkgbase}")
pkgver=17.2.1
pkgrel=1
pkgdesc="Navicat Premium Lite"
arch=('x86_64' 'aarch64')
url="https://www.navicat.com/products/navicat-premium-lite"
license=('proprietary')
source_x86_64=(
	"${pkgbase}-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-en-x86_64.AppImage"
	"${pkgbase}-cs-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-cs-x86_64.AppImage"
)
source_aarch64=(
	"${pkgbase}-en-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-en-aarch64.AppImage"
	"${pkgbase}-cs-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-cs-aarch64.AppImage"
)
sha256sums_x86_64=('0e2d3a44ff358a2239019fe68a0661d3abbf58e8bd4b9ec4e81464c0d86faf2f'
                   'f7d3e232b87a8f0719e6cc35e8d943317f774bc9561c1440f1764ec5c0cfca64')
sha256sums_aarch64=('00c414c1fb77e885d603e06160fac87247f91003d40bb3ed622d83a8a4db6135'
                    '71de95fcd1b2514415e81ae777f7baa0d6520e7bbe2f1c5a896ff5091b2cbb0b')

package_navicat-premium-lite-en() {
	pkgdesc='Navicat Premium Lite is a compact version of Navicat'

	_lang=en
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"
	
	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -s "/${_pkgroot}/AppRun" "${pkgdir}/usr/bin/navicat"
}
package_navicat-premium-lite-cs() {
	pkgdesc="Navicat Premium Lite 是 Navicat 的精简版"

	_lang=cs
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"
	
	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -s "/${_pkgroot}/AppRun" "${pkgdir}/usr/bin/navicat"
}
