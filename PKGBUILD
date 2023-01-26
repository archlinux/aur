# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=compressonator-cli-bin
pkgver=4.3.206
pkgrel=1
pkgdesc="CLI for GPU texture compression, decompression, format transcoding, and more"
arch=('x86_64')
url="https://github.com/GPUOpen-Tools/compressonator"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/V$pkgver/compressonatorcli-$pkgver-Linux.tar.gz"
        "compressonatorcli")
sha256sums=('48d3d7bbfd40e2bd1f2a3272bb3395864356f81702b0ee02cf613aa80ec554e2'
            '32d568df026553e9b0d48574ce9dd3b5186adeec24113ba7a976a2e6c2af4297')
backup=()

package() {
  tree
  mkdir -p "$pkgdir"/usr/lib/compressonator-cli-bin
  mkdir "$pkgdir"/usr/bin
  cp compressonatorcli "$pkgdir"/usr/bin/
  # pascal case for compatibility with previous releases
  cp compressonatorcli "$pkgdir"/usr/bin/CompressonatorCLI
  cp -r "compressonatorcli-$pkgver-Linux"/* "$pkgdir"/usr/lib/compressonator-cli-bin/
  chmod +x "$pkgdir"/usr/lib/compressonator-cli-bin/compressonatorcli
}
