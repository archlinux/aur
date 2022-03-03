# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.1.5793.6
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://lbrowser.loongnix.cn"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('46a8ae98533780532678d9be9bb8ede82c00a88ec6ee6c66f82049a4c811834872d6d98f3635d82b089c40bd0a1dc0b12e2786e8b90ddece32c3d334787c2c74')
sha512sums_loongarch64=('42bc12b3075351b706969e11791d5a5b1d8945f5e16f8e1e677d4d9a816ca42faf9430b04cecb2f9637093ffb94d277772750389b15b7a936c1a1cc56cdc78f1')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

	for _size in 16 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/usr/lib/lbrowser/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
	done
}
