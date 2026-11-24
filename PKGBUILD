# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=scythe-bin
pkgver=0.20.2
pkgrel=1
pkgdesc="SQL formatting, linting and security auditing"
arch=('x86_64' 'aarch64')
url="https://github.com/goldziher/scythe"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/scythe-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/scythe-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5320a713427c09d87d56790a5e1e8ac134e5b22439cf3d386b3bd2a0961f1976')
sha256sums_aarch64=('8e165518d6d4530e2fc84826fd15eed20dd80efe9d8773be9b89585c1c646fe2')

package() {
  install -Dm755 "scythe" "${pkgdir}/usr/bin/scythe"
  install -Dm755 "scythe-pg15-parser" "${pkgdir}/usr/bin/scythe-pg15-parser"
  install -Dm755 "scythe-pg18-parser" "${pkgdir}/usr/bin/scythe-pg18-parser"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
