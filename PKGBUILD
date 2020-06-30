# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=ttf-ligatured-hack
pkgver=v3.003+FC3.1+JBMv1.0.6
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
sha256sums=("1e694ffdde1d2039492a1472bf65c95c72c29b1852b8fe96c2620e59eebb998f"
            "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903")

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -Dm644 ./${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/${pkgver}-LICENSE
}

