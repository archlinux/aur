pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-cs")
provides=("${pkgbase}")
pkgver=17.3.1
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
sha256sums_x86_64=('34063cb9193faa368a8623c2f7843a32d352235b6981a0664d6d8d042adb2e77'
                   '4c9d6c0ece90136be02c4b47d841fb460f78fe3159e150bb3c9e4bab9c91828b')
sha256sums_aarch64=('c56f9292d03a00080f5820893f0112a578a40a63996bd2223922265d312ed8b6'
                    'a36abffad47d9cfceb2ee69e8d096585948e65187b7638c91abd399fee7498b1')

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
