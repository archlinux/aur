# Maintainer: Zachary Vance <za3k at za3k dot com>

pkgname=qr-backup
pkgver=1.1.4
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
sha256sums=('d81aa6d8b76c8f93f05ff07577914e9e43003f7a12f8299d68c78fc6efa0238c'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
