# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Code Liger <codeliger@protonmail.com>

pkgname=video-compare
pkgver=20231224
pkgrel=1
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2"
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL')
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pixop/video-compare/archive/${pkgver}.tar.gz")
sha256sums=('f681184b17f21aa82b67682c37d5fcb24c53057ca74c3c0096d68b9918ab842c')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/${pkgname}"
}
