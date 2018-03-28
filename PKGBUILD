# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=annie
pkgver=0.6.2
pkgrel=1
arch=('any')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=("go")
depends=("ffmpeg")
conflicts=("annie")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iawia002/annie/archive/${pkgver}.tar.gz")
sha256sums=("acfeedc8b34258cd460ac8cf1f88f4e326aa6e58c97613ad840255a2e551cf98")


build(){
	cd "${pkgname}-${pkgver}"
	go build 
}

package(){
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

