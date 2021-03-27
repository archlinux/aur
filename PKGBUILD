# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=arpfox-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
url="https://github.com/malfunkt/arpfox"
pkgdesc='An arpspoof alternative (written in Go) that injects spoofed ARP packets into a LAN.'
arch=(x86_64 i686 armv7h)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_386.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm7.gz")

prepare() {
  cd "$srcdir"

  if [ -f "arpfox_linux_amd64" ]; then
    mv arpfox_linux_amd64 arpfox
  elif [ -f "arpfox_linux_386" ]; then
    mv arpfox_linux_386 arpfox
  else
    mv arpfox_linux_arm7 arpfox
  fi
}

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('1da18576e853897cfd369d4b14b996b87f43352bc5d9f2f2c299c5d06f9c1bad')
sha256sums_i686=('60d178f95088a1907704aee4fe9eaa89c61f126c373ce88c649a91227cca5665')
sha256sums_armv7h=('e777d00f6c96ac4696b2625a5b88b1062982474763467b66389581b72ade9165')
