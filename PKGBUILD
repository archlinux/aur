# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Code Liger <codeliger@protonmail.com>

pkgname=video-compare
pkgver=20240107
pkgrel=1
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2"
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL')
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pixop/video-compare/archive/${pkgver}.tar.gz")
sha256sums=('977f3945642c9874f6b5ae30589f61411819db1f2ad7b600758bb8dfbb1b29a9')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/${pkgname}"
}
