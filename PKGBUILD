# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.2
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.certilia.com"
wpdmdlid=2529
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("$pkgname-$pkgver.deb::${url}/?wpdmdl=$wpdmdlid")
options=('!strip' 'staticlibs')
sha512sums=('de3e26e4bcee7a64665d6655a814d998d9fbe0c3dd02b970b1e74a9d9ee3f706024dce8083ad535669848c4e102fdbba96c0af0d9c71a6cee98dbccfe3a12216')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
