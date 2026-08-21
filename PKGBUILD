# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-benchmark-bin
pkgver=3.3.0
pkgrel=2
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests1"
arch=('x86_64')
url="https://opendata.blender.org"
license=('GPL-3.0-or-later AND CC0-1.0')
depends=('libxxf86vm' 'libx11' 'libglvnd' 'libgcc' 'libstdc++' 'glibc' 'libxcursor' 'libxrandr' 'libxi' 'libxinerama')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-${pkgver}-linux.tar.gz"
        "https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-cli-${pkgver}-linux.tar.gz")
noextract=()
sha256sums=('8578a4d3094225eb10f38d05c88e97bfa3d6a25a13206f7823cb77ccd03a0251'
            'a15e062179e7bf5cd20d58081f3c84cf87d56df3f596ffb0a11383638139324a')
options=(!strip)
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 benchmark-launcher "${pkgdir}/usr/bin/benchmark-launcher"
	install -Dm755 benchmark-launcher-cli "${pkgdir}/usr/bin/benchmark-launcher-cli"
}
