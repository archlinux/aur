# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=3.1.0
epoch=1
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL-3.0-or-later' 'CC0-1.0')
depends=('glibc' 'libglvnd' 'libxi' 'libx11' 'libxrandr' 'libxxf86vm' 'libxcursor' 'libxinerama' 'gcc-libs')
optdepends=('rocm-hip-runtime: Support AMD GPU acceleration'
           'cuda: Cycles render CUDA support'
           'intel-compute-runtime: Cycles renderer Intel OneAPI support')
options=('!strip')

source=("https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-${pkgver}-linux.tar.gz")
sha256sums=('4059c576407aa5add4f6280c59d68070b721572ec91aa6d5dfd528441070bb62')

package() {
  install -Dm755 "$srcdir/benchmark-launcher" "${pkgdir}/usr/bin/blender-benchmark"
}
