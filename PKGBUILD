# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=4.0.0
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
sha256sums=('c34b41b8434185d027098c18b9f529c6b5448216efb5573c917468ebdf18d134'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

package() {
  rm -dr usr/lib
  mv opt "$pkgdir"
  mv usr "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/exifcleaner"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/ExifCleaner/exifcleaner" "$pkgdir/usr/bin"
}
