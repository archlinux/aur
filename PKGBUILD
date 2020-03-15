# Maintainer: Tyler Johnson <tejohnso2 at popular google mail domain>
pkgname=slitherling
pkgver=21a329f
pkgrel=1
pkgdesc="A simple snake game. Feed your snake with fruit. Arrow keys, VIM keys, or spacebar (easy mode)."
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('sfml')
makedepends=('gcc>=9.0.0' 'cmake>=3.11' 'ninja>=1.10')
epoch=1584243336
build() {
        cd ..
	mkdir -p build
        tar xzf src.tar.gz
        cd build
        cmake -G "Ninja" -DCMAKE_BUILD_TYPE=MinSizeRel .. && ninja
}

package() {
        cd ..
        install -m 755 -d "${pkgdir}/usr/bin"
        install -m 755 -t "${pkgdir}/usr/bin/" "build/src/main/slitherling"

        install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
        install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "slitherling_font.ttf"
        install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "gulp.wav" "spawn.wav" "infect.wav"
        install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "SLITHERLING_VERSION" "apple.png"
}
