# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=droot-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="Simple chroot-based application container engine"
arch=('x86_64')
url="https://github.com/yuuki/droot"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/droot_linux_amd64.tar.gz")
sha256sums_x86_64=('6490a2f9f74468463a41fbc045a4828ccb40841dc22f8df95c995084a8dbcacd')

package() {
  install -Dm755 "droot_linux_amd64/droot" "${pkgdir}/usr/bin/droot"
  install -Dm644 "droot_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "droot_linux_amd64/LICENSE_OF_DEPENDENCIES.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "droot_linux_amd64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
