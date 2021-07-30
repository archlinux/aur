# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=compressonator-cli-bin
pkgver=4.2.5150
# this is different to the linux bin version for some reason
release_name=V4.2.5185
pkgrel=2
pkgdesc="CLI for GPU texture compression, decompression, format transcoding, and more"
arch=('x86_64')
url="https://github.com/GPUOpen-Tools/Compressonator"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/$release_name/compressonatorcli_linux_x86_64_$pkgver.tar.gz"
        "compressonatorcli")
sha256sums=('811b4e47ef7fa7996fde58e0dbd406379dc90a867a2fb89f18ea3141eb4579fa'
            '32d568df026553e9b0d48574ce9dd3b5186adeec24113ba7a976a2e6c2af4297')
backup=()

package() {
  mkdir -p "$pkgdir"/usr/lib/compressonator-cli-bin
  mkdir "$pkgdir"/usr/bin
  cp compressonatorcli "$pkgdir"/usr/bin/
  # pascal case for compatibility with previous releases
  cp compressonatorcli "$pkgdir"/usr/bin/CompressonatorCLI
  cp -r "compressonatorcli_linux_x86_64_$pkgver"/* "$pkgdir"/usr/lib/compressonator-cli-bin/
  chmod +x "$pkgdir"/usr/lib/compressonator-cli-bin/compressonatorcli
}
