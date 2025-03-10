# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=openbao-bin
pkgver=2.2.0
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
b2sums=(
  '00c234835ff59da541cf21fafcf574b412e39ef57c0f0eb0aff770017a95084d3f68bc6f39e07d56c9245fe2fbcb694b3eecd7c230f9714c39835771a2e55906'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/bao" "$pkgdir/usr/bin/bao"
  # should any default configuration or systemd files be included?
}

