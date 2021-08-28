# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
_pkgname=ExifCleaner
pkgver=3.6.0
pkgrel=4
pkgdesc="Desktop app to clean metadata from images, videos, PDFs, and other files."
arch=('x86_64')
url="https://exifcleaner.com"
license=('MIT')
depends=('nss' 'gtk3' 'perl')
provides=('exifcleaner')
install=ExifCleaner-bin.install
source=(
  "$pkgname-$pkgver.deb::https://github.com/szTheory/exifcleaner/releases/download/v$pkgver/exifcleaner_${pkgver}_amd64.deb"
  'LICENSE::https://github.com/szTheory/exifcleaner/raw/master/LICENSE'
)
sha512sums=(
  # For the `.deb` file
  '7416bbb800b9decb7dad931e75ea7636ecd0a98f6677c17b4b854363c547b46876df3155ea4ed37bfd91d09cb8ed4384caab75293d0d31f438def6093b43efcf'
  # For the `LICENSE` file
  '40505bfe313ac2630ff38bfb2e60ef71c73e23a6733d895e7af298074588d4a3831e11d38242af433cdffd0ac1ac66faeb5035894e4c87761f9fffc09fb501e2'
)

package() {
  tar xf "$srcdir/data.tar.xz" -C "$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
