# Maintainer: nsmcclellan <email not provided>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: rosenbaum <email not provided>

pkgname=imagescan-plugin-networkscan
pkgver=1.1.3
_pkgver=3.63.0
pkgrel=3
_fedrel=32
pkgdesc="Plugin for using Epson scanners with Image Scan v3 over network"
arch=("x86_64")
_pkgarch="x64"
url="http://support.epson.net/linux/en/imagescanv3.php"
license=("Custom License - See /usr/share/doc/${pkgname}/COPYING.EPSON.en.txt")
depends=("imagescan")
install=imagescan-plugin-networkscan.install
source_x86_64=("https://download2.ebz.epson.net/imagescanv3/fedora/latest1/rpm/x64/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.x64.rpm.tar.gz")
sha256sums_x86_64=('d5d16fbcd0baab55d08f0a6a44ef43fdd0d9e08ae9d803274dd4a6ba28b4604c')

prepare() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  bsdtar -xf ${pkgname}-${pkgver}-1epson4fedora${_fedrel}.${CARCH}.rpm
}

package() {
  cd $srcdir/imagescan-bundle-fedora-${_fedrel}-${_pkgver}.${_pkgarch}.rpm/plugins
  install -Dm755 usr/libexec/utsushi/networkscan $pkgdir/usr/lib/utsushi/networkscan
  install -Dm644 usr/share/doc/${pkgname}/COPYING.EPSON.en.txt $pkgdir/usr/share/doc/${pkgname}/COPYING.EPSON.en.txt
  install -Dm644 usr/share/doc/${pkgname}/NEWS $pkgdir/usr/share/doc/${pkgname}/NEWS
  install -Dm644 usr/share/doc/${pkgname}/README $pkgdir/usr/share/doc/${pkgname}/README
}
