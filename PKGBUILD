# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: nsmcclellan <email not provided>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: rosenbaum <email not provided>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.4
_pkgver=3.65.0
pkgrel=0
_fedrel=32
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=(x86_64)
url="http://support.epson.net/linux/en/imagescanv3.php"
license=(custom)
depends=(imagescan)
install=imagescan-plugin-networkscan.install
source=("https://buzo.eu/mirror/epson/imagescan-bundle-fedora-$_fedrel-$_pkgver.x64.rpm.tar.gz")
sha256sums=('7f18badec57e6093a5bf56954df08f21738f7cd028f91ef334fbc0d75b0598c9')

prepare() {
  cd "$srcdir/imagescan-bundle-fedora-$_fedrel-$_pkgver.x64.rpm/plugins"
  bsdtar -xf "$pkgname-$pkgver-1epson4fedora$_fedrel.$CARCH.rpm"
}

package() {
  cd "$srcdir/imagescan-bundle-fedora-$_fedrel-$_pkgver.x64.rpm/plugins"
  install -Dm755 usr/libexec/utsushi/networkscan $pkgdir/usr/lib/utsushi/networkscan
  install -Dm644 usr/share/doc/"$pkgname"/COPYING.EPSON.en.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
  install -Dm644 usr/share/doc/$"$pkgname"/NEWS   "$pkgdir/usr/share/doc/$pkgname"/NEWS
  install -Dm644 usr/share/doc/$"$pkgname"/README "$pkgdir/usr/share/doc/$pkgname"/README
}
