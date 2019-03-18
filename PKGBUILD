# Maintainer: Enihcam <gmail n a n e r i c w a n g>
# Contributor: Enihcam <gmail n a n e r i c w a n g>

_pkgname=onedrive
pkgname=onedrive-bin
pkgver=2.2.6
pkgrel=2
pkgdesc='Free OneDrive client written in D'
arch=('x86_64' 'aarch64')
url='https://github.com/abraunegg/onedrive'
license=('GPL3')
provides=('onedrive')
conflicts=('onedrive' 'onedrive-abraunegg-git')
depends=('liblphobos' 'gcc-libs' 'sqlite')
optdepends=('libnotify: notification support')
source_x86_64=("http://http.us.debian.org/debian/pool/main/o/onedrive/onedrive_${pkgver}-${pkgrel}_amd64.deb")
source_aarch64=("http://http.us.debian.org/debian/pool/main/o/onedrive/onedrive_${pkgver}-${pkgrel}_arm64.deb")
sha256sums_x86_64=('8647444295c2a6c223e6f9e39e6126b12e693afecdf95638fad55bb3c13fea11')
sha256sums_aarch64=('8d71ed8d1573bde34f6fb0d5cfd8ed8ccff97c9c53e77713cc0dae7a234d39e7')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  install -Dm644 "$pkgdir/usr/share/doc/onedrive/config" "$pkgdir/usr/share/onedrive/config.default"
  install -Dm644 "$pkgdir/lib/systemd/system/onedrive@.service" "$pkgdir/usr/lib/systemd/system/onedrive@.service"
  ln -sf "$pkgdir/usr/lib/libphobos2-ldc-shared.so" "$pkgdir/usr/lib/libphobos2-ldc-shared.so.82"
  ln -sf "$pkgdir/usr/lib/libdruntime-ldc-shared.so" "$pkgdir/usr/lib/libdruntime-ldc-shared.so.82"
  rm -fr "$pkgdir/lib"
}
