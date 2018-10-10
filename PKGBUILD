#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=antibody-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Antibody is a shell plugin manager made from the ground up thinking about performance"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('antibody')
source_i686=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
source_x86_64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_armv6h=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_armv6.tar.gz")
source_aarch64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_arm64.tar.gz")
url="https://github.com/getantibody/antibody"
license=("MIT")
sha256sums_i686=("2854247291679b3305133f84c96be355f0397d99400286811a009006c6ff506c")
sha256sums_x86_64=("a1c69b7a19425a6e15741cf280bc14b1f1d7085c426395fe59463544abbb8912")
sha256sums_armv6h=("e3c7985a72153b3a134f13305b4cc76af0f60aeb968a1edd6250454cb57505ea")
sha256sums_aarch64=("00d88a182cab434891281019b43225472d2b9caf48ea9a1c6c6e5df3dae895a3")

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
