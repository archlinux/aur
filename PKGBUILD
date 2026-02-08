# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=oyasumi
pkgver=0.5.0
pkgrel=1
_oyasumiver=25.6.12
pkgdesc="Oyasumi (VR Sleeping Utilities)"
arch=('x86_64')
url="https://github.com/sofoxe1/OyasumiVR"
license=('MIT')
source=("$pkgname-$_oyasumiver-$pkgver.tar.gz::https://github.com/sofoxe1/OyasumiVR/releases/download/oyasumivr-v$_oyasumiver-linux-v$pkgver/oyasumi-linux.tar.zst")
sha256sums=('b64257a84d5eb8a429c4c131413e11658821cd350154bc24a0b16bc301c89874')

prepare() {
  # Extract the source archive
  tar -xf "$srcdir/$pkgname-$_oyasumiver-$pkgver.tar.gz" -C "$srcdir"
}

package() {  
  # Install only the executable
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/Oyasumi/OyasumiVR" "$pkgdir/usr/bin/oyasumivr"
  install -m755 "$srcdir/Oyasumi/resources/sidecars/oyasumivr-overlay-sidecar" "$pkgdir/usr/bin/oyasumivr-overlay-sidecar"

  # Install resources in /usr/share/oyasumi
  install -d "$pkgdir/usr/share/oyasumi/"
  cp -r "$srcdir/Oyasumi/resources"/* "$pkgdir/usr/share/oyasumi/"
}
