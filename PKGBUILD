# Maintainer: kobe-koto <admin[at]koto.cc>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=0.3.1
pkgrel=2
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/mo-jinran/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq" "sudo")
makedepends=("wget")
provides=("liteloader-qqnt")
source=("https://github.com/mo-jinran/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz" "install.sh")
md5sums=('SKIP')

prepare() {
	if [ ! -d ./${pkgname} ]; then
		mkdir ./${pkgname}
	fi
}

build() {
	if [ -d ./${pkgname}/${_pkgname}-${pkgver} ]; then
		rm -r ./${pkgname}/${_pkgname}-${pkgver}
	fi
	mv ./${_pkgname}-${pkgver} ./${pkgname}/
	cp -f ./install.sh ./${pkgname}/

	# echo "Downloading install script..."
	# wget "https://github.com/kobe-koto/LiteLoaderQQNT-Linux-Installer/raw/main/installer.sh" -O "./${pkgname}/install.sh"
}

package() {
	echo "-------- Tip --------"
        echo "run /usr/lib/${pkgname}/install.sh to install ${_pkgname}."
        echo "-------- Tip --------"

	mkdir -p "${pkgdir}/usr/lib"
	cp -a "${pkgname}" "$pkgdir/usr/lib/${pkgname}"
}
