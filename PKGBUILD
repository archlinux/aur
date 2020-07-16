# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=ttf-ligatured-hack
pkgver=v3.003+FC3.1+JBMv2.001
pkgrel=2
pkgdesc="Latest ligatures with Hack font built with fully automated CI/CD by gaplo917"
arch=("any")
url="https://github.com/gaplo917/Ligatured-Hack"
license=("GPL3")
depends=("fontconfig")
provides=("ttf-hack")
conflicts=("ttf-hack-ligatured")
source=("https://github.com/gaplo917/Ligatured-Hack/releases/download/${pkgver}/HackLigatured-${pkgver}.zip"
        "${pkgver}-LICENSE::https://raw.githubusercontent.com/gaplo917/Ligatured-Hack/master/LICENSE")
sha256sums=("5de88284b3e0a428146e46c0671dbe3044406d8fad18c0fa2edd35ae33ba2a74"
            "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903")

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -m644 ${srcdir}/output/*.ttf ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -Dm644 ./${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/${pkgver}-LICENSE
}

