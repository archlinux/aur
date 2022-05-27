# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=darling-dkms
pkgver=0.1.20220213
pkgrel=2
pkgdesc="Kernel module for Darling"
arch=('x86_64')
url="https://github.com/darlinghq/darling"
license=('GPL')
groups=('darling-bin')
depends=('dkms')
source=("$url/releases/download/v$pkgver/${pkgname}_0.1.20220125.focal_amd64.deb")
sha512sums=('5896acab5d8a4f2c46ecee864c299a9e7f77e159173812ad3303fd0e893c167ba1428daea26bc522a445fea68010c94bf24646a5fe3972feffec12fe38e01a58')
options=(!strip !emptydirs)
install=$pkgname.install

package() {
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.xz"
  install -Dm644 "usr/src/darling-mach-0.1/lkm/tools/tests/libMicro/OPENSOLARIS.LICENSE" \
    "usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "usr/src/darling-mach-0.1/lkm/security/conf/copyright.nai" \
    "usr/share/licenses/$pkgname/COPYRIGHT"
}
