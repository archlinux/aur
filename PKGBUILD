# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.2.1453.0
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://lbrowser.loongnix.cn"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('77647ae930a0b85de8975c52fbe4f09c4a972c2eb461f9227fd2d6d9c10563fe80156781c3386ddb55a7c1e3b610847475f18ad56c9c099906544b59605269ce')
sha512sums_loongarch64=('67206b649304c5144afad7325e442eccf0fde08f7417d1a4d2bf592555e6ddbb0e39054ada4597239520d21cb68b44723624defa635db82ad48ddfecfa900f36')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

	for _size in 16 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/usr/lib/lbrowser/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
	done
}
