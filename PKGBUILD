#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=3.7.0
pkgrel=2
pkgdesc="Antibody is a shell plugin manager made from the ground up thinking about performance"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('antibody')
source_i686=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
source_x86_64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_armv6h=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv6.tar.gz")
source_aarch64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_arm64.tar.gz")
url="https://github.com/getantibody/antibody"
license=("MIT")
sha256sums_i686=("3ac722a545cd32b93f4a790ac8d7764c26f747e49b5ab257a69717797b5db73c")
sha256sums_x86_64=("7b354046f742739c88affe63359321c19d36ad5e39a3e4bc3f2cad5e6daf4c80")
sha256sums_armv6h=("9c150ba3665a11a623b20b8bbc9baec5e8ba2dcc23c155bc2348a9a5cb05dbe3")
sha256sums_aarch64=("01f761d5420fb393c6b803cb93696b7784aa33cc9aa2238f594c2790d010e601")

package() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "i686" ]; then
    _ARCH="i386"
  elif [ "$CARCH" == "x86_64" ]; then
    _ARCH="x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _ARCH="arm64"
  else
    _ARCH="armv6"
  fi

  # Unpack, flag as executable and move to the right directory
  install -Dm755 "antibody" "$pkgdir/usr/bin/antibody"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/antibody/LICENSE"
}
