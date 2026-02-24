# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=openbao-bin
pkgver=2.5.1
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
b2sums=('7f2cdd0e11255d787d4a2d95a5d38250120556180eaf6ebfc8c08463420db3929258de1a6de220e978da66bb13583fdbdd68998677caa31c9b8505aaaf61a85b'
        'SKIP')

package() {
  install -Dm755 "$srcdir/bao" "$pkgdir/usr/bin/bao"
  # should any default configuration or systemd files be included?
}

