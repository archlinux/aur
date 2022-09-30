# Maintainer: Zachary Vance <za3k at za3k dot com>

pkgname=qr-backup
pkgver=1.1.2
pkgrel=2
pkgdesc="Paper backup of files using QR codes"
url="https://github.com/za3k/qr-backup"
license=('custom:CC0')
arch=('any')
depends=('imagemagick' 'python' 'python-pillow' 'python-reedsolo' 'python-qrcode' 'ttf-dejavu' 'zbar')
optdepends=('gnupg')
conflicts=()
source=("https://github.com/za3k/qr-backup/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0ad5b22312d93009eb32388f37cfdb44b882f91b87212a50dbe8bf547241b8012a4327b81c45a128deddf35702ee3a43c6a4efe0de88ff0395305f6dbbc9c4c3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
