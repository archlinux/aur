# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=10
pkgrel=1
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('custom:WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
backup=('etc/butterrc')
source=("https://github.com/moviuro/butter/archive/${pkgver}.tar.gz")
sha256sums=('658b2a8e64e212f50103b176dd1dc9e2b99bea1fa185dff6b7494a7aa3672dd9')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr ETCDIR=${pkgdir}/etc MANDIR=${pkgdir}/usr/share/man \
    LICENSEDIR=${pkgdir}/usr/share/licenses install
}
