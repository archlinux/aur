# Maintainer: grmat <grmat@sub.red>

pkgname=zcash-bin
pkgdesc='Official Zcash client, binary tarball version.'
pkgver=1.0.14
pkgrel=2
arch=('x86_64')
url='https://z.cash'
license=('MIT')
makedepends=('')
depends=()

source=("https://z.cash/downloads/zcash-${pkgver}-linux64.tar.gz"
        'zcash.service')
sha256sums=('352ea2a67ae3484046a6bd43af9a5ce125e2d103a6a32ac71805658918f7076a'
            '47c67da9e9ae8870a1b0e24ea352bd4778f9c51b4447410b85fe79d7f84974ef')

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/user"
  cp "${srcdir}/zcash.service" "${pkgdir}/usr/lib/systemd/user/"

  cp -r "${srcdir}/zcash-${pkgver}/bin" "${pkgdir}/usr/"
  cp -r "${srcdir}/zcash-${pkgver}/lib" "${pkgdir}/usr/"
  cp -r "${srcdir}/zcash-${pkgver}/include" "${pkgdir}/usr/"
  cp -r "${srcdir}/zcash-${pkgver}/share" "${pkgdir}/usr/"
}

