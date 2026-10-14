# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Clean metadata from images, videos, PDFs, and other files"
url="https://github.com/szTheory/exifcleaner"
license=('MIT')
arch=('x86_64')
depends=('at-spi2-atk' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
provides=("exifcleaner")
conflicts=("exifcleaner")
source=("$url/releases/download/v$pkgver/exifcleaner-$pkgver.x86_64.rpm"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('46c539b3882ee4a81694ed954b76cd85d539cd327efd9f8ba986983cdbc5f05c'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

package() {
  rm -dr usr/lib
  mv opt usr "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/exifcleaner"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/ExifCleaner/exifcleaner" "$pkgdir/usr/bin"
}
