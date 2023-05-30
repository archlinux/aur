# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.2.2149.2
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://lbrowser.loongnix.cn"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('b28d12039fb41a5fd0c655a7698dcfba63690d3c151689c6fc6d0ebe229940ac0cadb8d9464924cf8eb799bc6d359cd80cffc9c30e8c3bb51168eca67fdc9c7e')
sha512sums_loongarch64=('841735ef2be1d5f63cbee08e17e3f6e6dcc26810134ac6a76005930e7cecb3b8fc3d3bbfa1207e6f4c8eebc03873f8d2297342cb5b01b8d8f69766d95ff42e11')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

	for _size in 16 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/usr/lib/lbrowser/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
	done
}
