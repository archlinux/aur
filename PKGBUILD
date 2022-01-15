# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.1.5634.3
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://lbrowser.loongnix.cn"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=("958af44a2d4bf9a1e91bdc43dff96f5b45eb9e799a96cbd78cc6840c0ae930fff18608fb1d1855f55f4ef516461dd9471d3466cd3f859a48e1381c597e3e77d5")
sha512sums_loongarch64=("f007ca89088e666c54e756ec3572f954c4a16cd4f0fd050e32c20e057edc73d608d87fdcde9fa30d5887188fef01b1beb76e54183a0fe8a9bb348c19e3494b4e")

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

	for _size in 16 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/usr/lib/lbrowser/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
	done
}
