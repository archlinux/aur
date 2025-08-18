# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=openbao-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="solution to manage, store, and distribute sensitive data"
arch=("x86_64")
url="https://openbao.org"
license=('MPL-2.0')
depends=(glibc)
provides=('openbao=2.2.0')
conflicts=('openbao')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/openbao/openbao/releases/download/v${pkgver}/bao_${pkgver}_Linux_x86_64.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/openbao/openbao/releases/download/v${pkgver}/bao_${pkgver}_Linux_x86_64.tar.gz.gpgsig"
)
# Note: The public key can be downloaded from https://openbao.org/assets/openbao-gpg-pub-20240618.asc
# See https://openbao.org/docs/install/
validpgpkeys=('66D15FDD87287219C8E15478D200CD702853E6D0')
b2sums=('a062ecd4441ce71afa58f8b6ad0947cc42f1ff24b7d080765e5d6db51c4107102f48493529858a1ab5c7280b59c5609e29a25a5c873e4dc07d33703f7a848b80'
        'SKIP')

package() {
  install -Dm755 "$srcdir/bao" "$pkgdir/usr/bin/bao"
  # should any default configuration or systemd files be included?
}

