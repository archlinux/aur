# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=ash-listening-set
pkgver=9.3
pkgrel=1
pkgdesc="A dataset of filters for headphone correction and binaural synthesis of spatial audio systems on headphones"
arch=('any')
url="https://github.com/ShanonPearce/ASH-Listening-Set.git"
license=('Creative Commons')
replaces=('ash-ir-dataset-git')
depends=()
source=("https://github.com/ShanonPearce/ASH-Listening-Set/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0765af61142459eb0dcd551d5fd8a96e9a522c7134d0ca86df2246788d918c8e')

package() {
  cd "$srcdir"/ASH-Listening-Set-$pkgver
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/ash-listening-set/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ash-listening-set/README.md"
  cp -r "Wiki-Images" "$pkgdir/usr/share/doc/ash-listening-set/"
  cp -r "Additional_Filters" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "BRIRs" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "Compatibility_Filters" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "E-APO_Configs" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "HeSuVi" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "HpCFs" "$pkgdir/usr/share/ash-listening-set/"
  cp -r "Pipewire" "$pkgdir/usr/share/ash-listening-set/"
  find "$pkgdir/usr/share/ash-listening-set/" -type d -exec chmod 755 {} \; 
  find "$pkgdir/usr/share/ash-listening-set/" -type f -exec chmod 644 {} \;
  #find "$pkgdir/usr/share/ash-listening-set/HpCFs/Graphic_EQ/" -type f -print0 | xargs -0 dos2unix
}

