# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lzturbo
pkgver=1.2
pkgrel=3
pkgdesc="High performance lz77 based compressor"
arch=('x86_64')
url="https://sites.google.com/site/powturbo/home"
license=('LicenseRef-lzturbo')
source=("$pkgname.7z::https://drive.usercontent.google.com/download?id=15mPIJo5pDTT9Xb3i4ek8D4ejNcjszBLT&export=download")
sha256sums=('c5212cf0dcdbb35ebce5e3126fe8ec53bfd7618744a36b14ce08fb26bdb73d55')


prepare() {
  cd "lzturbo"

  sed -n '/IF YOU DO NOT AGREE TO/,/*$/p' "README.md" > "LICENSE"
}

package() {
  cd "lzturbo"

  install -Dm755 "lzturbo_static" "$pkgdir/usr/bin/lzturbo"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/lzturbo"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lzturbo"
}
