# Maintainer: Zachary Vance <za3k at za3k dot com>

pkgname=qr-backup
pkgver=1.1.3
pkgrel=2
pkgdesc="Paper backup of files using QR codes"
url="https://github.com/za3k/qr-backup"
license=('custom:CC0')
arch=('any')
depends=('imagemagick' 'python' 'python-pillow' 'python-reedsolo' 'python-qrcode' 'ttf-dejavu' 'zbar')
optdepends=('gnupg')
conflicts=()
source=("https://github.com/za3k/qr-backup/releases/download/v${pkgver}/qr-backup-${pkgver}.tar.gz"
        "https://github.com/za3k/qr-backup/releases/download/v${pkgver}/qr-backup-${pkgver}.tar.gz.sig")
validpgpkeys=('4F92E819BBDB4225ABE690437DA2C1641594B27F')
sha512sums=('b9fca9c4db4f56976a2bd11498a400ec16b98f0165dc7575fa366d7afcaab69618b1fbde8a24f6a9d129ea8216322a302d020f4b8f5296217829c08c8d07e0bd' 'a9e76c62eaa9feade812290aa521028cd658e67702d62071e783564a6f66404e575c4c6baf5d5f97acdaeb79e14ffdaece5d682e8f7b609547937ee334cfb9e9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
