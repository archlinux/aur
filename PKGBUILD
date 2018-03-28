# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=annie-git
pkgver=0.6.2.r5.g7f029d2
pkgrel=1
arch=('any')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=("go")
depends=("ffmpeg")
provides=("annie")
conflicts=("annie")
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${pkgname%-git}"
	go build
}

package(){
	install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

