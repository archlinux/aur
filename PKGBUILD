pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-cs")
provides=("${pkgbase}")
pkgver=17.2.5
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
sha256sums_x86_64=('7316ca0dc59d2ae56442f65f8d0c5583ec6e1ae6e2768130c5bf212838e992ef'
                   '6fdcd6d8cddf1f8579084c2dff37920e7fdbb7b8d5502651975db8f05bc2c5aa')
sha256sums_aarch64=('198cf5dac077c8beaf1762c5d58b8365a28018d75145b0d0253ae0c2e19feb6a'
                    '7d212c25f5b658315f94d9ccba76ffaf0f1c95b308c27a5b561a2ffebd42f51e')

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
