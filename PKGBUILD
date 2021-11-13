# Maintainer: Pavel Lymarev <x-user at bk dot ru>

pkgname=efi-mkkeys
pkgver=0.1.0
pkgrel=1
pkgdesc='Script to easily generate self-signed UEFI keys for Secure Boot'
arch=(any)
url='https://github.com/jirutka/efi-mkkeys/#readme'
license=(MIT)
depends=(bash openssl efitools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jirutka/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec008bea3935ebf2c439d430c37851de7346589e1b2edaed03771ef590e98f42')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make prefix=/usr DESTDIR="${pkgdir}" install
}
