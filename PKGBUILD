# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray<k@ketal.icu>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=0.5.1
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=("${url}/releases/download/${pkgver}/${_pkgname}.zip"
		"liteloader-qqnt-depatch.hook"
		"liteloader-qqnt-patch.hook")
md5sums=('SKIP'
         '00854a75b74467a0b496b3f214cc5d43'
         '1f0109321d95c7002d3c4668f4679a9c')

package() {
	mkdir -p "${pkgdir}/opt/QQ/resources/app"
	cp -a "${srcdir}/LiteLoader" "${pkgdir}/opt/QQ/resources/app/LiteLoader"

	# install hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
}
