# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=openbao-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="solution to manage, store, and distribute sensitive data"
arch=("x86_64")
url="https://openbao.org"
license=('MPL-2.0')
depends=(glibc)
provides=("openbao=${pkgver}")
conflicts=('openbao')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/openbao/openbao/releases/download/v${pkgver}/bao_${pkgver}_Linux_x86_64.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/openbao/openbao/releases/download/v${pkgver}/bao_${pkgver}_Linux_x86_64.tar.gz.gpgsig"
)
# Note: The public key can be downloaded from https://openbao.org/assets/openbao-gpg-pub-20240618.asc
# See https://openbao.org/docs/install/
validpgpkeys=('66D15FDD87287219C8E15478D200CD702853E6D0')
b2sums=('72aa11d979aa8eb85a4f8dea9779dc5ffb545fe2264904ba9cb1c987430c51911d5b8148b3c8319f5544921138f872026675c88af96c54345fb68860abf31f1b'
        'SKIP')

package() {
  install -Dm755 "$srcdir/bao" "$pkgdir/usr/bin/bao"
  # should any default configuration or systemd files be included?
}

