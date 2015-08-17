# Maintainer: Zack Buhman <zack@buhman.org>

pkgname=erebor-ca
pkgver=2
pkgrel=1
pkgdesc="Erebor Certificate Authority"
url='https://buhman.org/'
arch=('any')
license=('GPL')
depends=('ca-certificates-utils')

install=erebor-ca.install
source=('https://buhman.org/erebor-ca/erebor-ca.pem'
        'https://buhman.org/erebor-ca/erebor-ca.pem.sig')
md5sums=('1b190f39c21c607c65cf01fb57d314e1'
         'SKIP')
validpgpkeys=('5F1B59099FA4D372EC9B30714A8337182ED3B474')

package() {
  local _certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -d "$_certdir"
  install -t "$_certdir" -m644 *.pem
}
