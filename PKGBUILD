# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seekdb-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="The AI-Native Search Database"
arch=('x86_64' 'aarch64')
url="https://github.com/oceanbase/seekdb"
license=('Apache-2.0')
depends=('glibc' 'libaio')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/seekdb-binary-${pkgver}.0-linux-x86_64-glibc2.17-20261125T072630Z-sdbab58f3d233bc.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/seekdb-binary-${pkgver}.0-linux-aarch64-glibc2.17-20261125T072918Z-sdbab58f3d233bc.tar.gz")
sha256sums_x86_64=('ba4879645b4fc79e7baf9fd0bcb5a966a8a5361caa7f48e8bf89e9af77e0ccc9')
sha256sums_aarch64=('0a3825820fccd3e8443a1a2264c74b2139ccfa2afe821f20648e0dd2e353e719')

package() {
  install -Dm755 "bin/seekdb" "${pkgdir}/usr/bin/seekdb"
  install -Dm755 "lib/seekdb/libaio.so.1" "${pkgdir}/usr/bin/libaio.so.1"
  install -Dm644 "licenses/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licenses/gcc-libgomp/COPYING.RUNTIME" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licenses/gcc-libgomp/COPYING3" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licenses/jemalloc/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licenses/openssl-3/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licenses/pthreads4w/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/gcc-libgomp/COPYING.RUNTIME" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/gcc-libgomp/COPYING3" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/jemalloc/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/openssl-3/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "share/seekdb/licenses/pthreads4w/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
