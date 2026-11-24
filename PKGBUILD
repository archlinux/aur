# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cinema-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Command-line video multiviewer"
arch=('x86_64')
url="https://github.com/marm00/cinema"
license=('MIT')
depends=('glibc' 'openmp')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/marm00/cinema/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/cinema-v${pkgver}-linux-x86_64.zip")
sha256sums=('e8e5bfb31748c36bf2a2cc540e753a3353e05a3d17b70b232069b13fa3739bf7')
sha256sums_x86_64=('5beecd238ef73542e45faac45701c54d9ac513f3df31b8c53fd1d2e6066499b0')

package() {
  install -Dm755 "cinema" "${pkgdir}/usr/bin/cinema"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
