# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-benchmark-cli
pkgver=3.1.0
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL-3.0-or-later' 'CC0-1.0')
depends=('glibc' 'gcc-libs')
optdepends=('rocm-hip-runtime: HIP renderer AMD support'
	    'cuda: Cycles renderer Nvidia support'
	    'intel-compute-runtime: Cycles renderer Intel support')
source=(https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-cli-${pkgver}-linux.tar.gz)
sha256sums=('b1b616a12d3f5a3a39ee1322b6489cfb7c4f921f5eadda01d1ef9af422b7520f')
options=('!strip')

package() {
	install -Dm755 "${srcdir}/benchmark-launcher-cli" "${pkgdir}/usr/bin/${pkgname}"
}
