# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=ash-ir-dataset-git
pkgver=r395.f22942d37
pkgrel=2
pkgdesc="An impulse response dataset for binaural synthesis of spatial audio systems on headphones"
arch=('any')
url="https://github.com/ShanonPearce/ASH-IR-Dataset"
license=('Creative Commons')
depends=()
source=("git+https://github.com/ShanonPearce/ASH-IR-Dataset.git")
sha256sums=('SKIP')

pkgver() {
  cd ASH-IR-Dataset
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/ASH-IR-Dataset/LICENSE.txt" "$pkgdir/usr/share/licenses/ash-ir-dataset/LICENSE"
  install -Dm644 "$srcdir/ASH-IR-Dataset/README.md" "$pkgdir/usr/share/doc/ash-ir-dataset/README.md"
  cp -r "$srcdir/ASH-IR-Dataset/BRIRs" "$pkgdir/usr/share/ash-ir-dataset/"
  cp -r "$srcdir/ASH-IR-Dataset/Compatibility_Filters" "$pkgdir/usr/share/ash-ir-dataset/"
  cp -r "$srcdir/ASH-IR-Dataset/HpCFs" "$pkgdir/usr/share/ash-ir-dataset/"
  cp -r "$srcdir/ASH-IR-Dataset/Plots" "$pkgdir/usr/share/ash-ir-dataset/"
  find "$pkgdir/usr/share/ash-ir-dataset/" -type d -exec chmod 755 {} \; 
  find "$pkgdir/usr/share/ash-ir-dataset/" -type f -exec chmod 644 {} \; 
}

