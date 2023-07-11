# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray<k@ketal.icu>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=0.3.1
pkgrel=6
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
provides=("liteloader-qqnt")
install=${pkgname}.install
source=("https://github.com/mo-jinran/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
	mkdir -p ./${pkgname}
}

build() {
	if [ -d ./${pkgname}/${_pkgname}-${pkgver} ]; then
		rm -r ./${pkgname}/${_pkgname}-${pkgver}
	fi
	mv ./${_pkgname}-${pkgver} ./${pkgname}/
}

package() {
	mkdir -p "${pkgdir}/usr/lib"
	cp -a "${pkgname}" "$pkgdir/usr/lib/${pkgname}"

	echo "======== TIPS ========"
	echo "If you reinstall/install/upgrade linuxqq after installing this package, "
	echo "you may need to reinstall this package to make LiteLoaderQQNT works."
	echo "======== TIPS ========"
}
