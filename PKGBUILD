# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-benchmark-cli
pkgver=3.3.0
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL-3.0-or-later' 'CC0-1.0')
depends=('glibc')
optdepends=('rocm-hip-runtime: HIP renderer AMD support'
	    'cuda: Cycles renderer Nvidia support'
	    'intel-compute-runtime: Cycles renderer Intel support')
source=(https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-cli-${pkgver}-linux.tar.gz)
sha256sums=('a15e062179e7bf5cd20d58081f3c84cf87d56df3f596ffb0a11383638139324a')
options=('!strip')

package() {
	install -Dm755 "${srcdir}/benchmark-launcher-cli" "${pkgdir}/usr/bin/${pkgname}"
}
