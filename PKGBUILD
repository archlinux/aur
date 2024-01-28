# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Code Liger <codeliger@protonmail.com>

pkgname=video-compare
pkgver=20240114
pkgrel=2
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2"
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL-2.0-only')
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pixop/video-compare/archive/${pkgver}.tar.gz")
sha256sums=('1cc9dc6a8cc2841ff1271f42c85a0bbe7ca8689b4b11760528f40fe88b17c114')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/${pkgname}"
}
