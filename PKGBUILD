pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-cs")
provides=("${pkgbase}")
pkgver=17.1.4
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
sha256sums_x86_64=('30acee897387710dd0860f67acdc3683fa08904b48391704e17010da29801a73'
                   'bc579c71bb02fe92434ca5dcb67e17220625a7a946d2a6bea84a6e890d19c724')
sha256sums_aarch64=('db5cc6c97afaf9d890c6fc1ca9891246b4217e0f190f90746e9747b3a2ff102f'
                    '6bb0d0922d136d033701761731bceb858a4e98d2a34d62d29ff75d3500fb7dd4')

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
