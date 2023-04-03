# Maintainer: 咸粽子 <xianzongzi aliyun.com>
_pkgname=lbrowser
pkgname=lbrowser-v3
pkgver=3.2.1815.1
pkgrel=1
pkgdesc="龙芯浏览器V3版（基于 Chromium）"
arch=('x86_64' 'loongarch64')
url="http://lbrowser.loongnix.cn"
license=('unknown')
conflicts=("lbrowser-v2")
source_x86_64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/amd64/${_pkgname}_${pkgver}-1.stable.amd64.deb")
source_loongarch64=("http://ftp.loongnix.cn/browser/${_pkgname}/${pkgver}/la64/${_pkgname}_${pkgver}-1.stable.loongarch64.deb")
sha512sums_x86_64=('a5b75c79d6eaf04bf55ef592df8d7d6c2a1c34ce49b34fcfa2bbc431dbee43ba6fe746a97cceee1ad8909657520e9106841421b49898df99649c013237610699')
sha512sums_loongarch64=('631a1c9c20f0b5da471850ef10942bd0664f2cbc27c5e71cd1b9e1152d111f8d1866baaaa9d6207fb599ed3314549d77742f21aa1aa67fa5113c05b35aee02a9')

package() {
	cd "${srcdir}"
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

	for _size in 16 24 32 48 64 128 256; do
		install -Dm644 "${pkgdir}/usr/lib/lbrowser/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
	done
}
