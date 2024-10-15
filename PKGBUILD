# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Co-maintainer: zxp19821005 <zxp19821005 at 163 dot com>
#
# Based on extra/electron by
# Caleb Maclennan <caleb@alerque.com>
# Bruno Pagani <archange@archlinux.org>

pkgver=33
pkgrel=1
pkgname=electron-bin
pkgdesc='Meta package providing the latest available stable Electron build'
pkgdesc+=' — binary'
arch=(any)
url='https://electronjs.org'
license=(MIT)
provides=("electron=${pkgver}")
conflicts=('electron')

package() {
	depends=("electron${pkgver}-bin")
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"

	local _electron_major="electron${pkgver}"
	ln -sf "${_electron_major}" "${pkgdir}/usr/bin/${pkgname}"
	ln -sf "${_electron_major}" "${pkgdir}/usr/lib/${pkgname}"
}
