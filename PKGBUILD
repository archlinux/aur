# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=perbase-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Per-base, per-nucleotide depth analysis"
arch=('x86_64')
url="https://github.com/sstadick/perbase"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sstadick/perbase/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/perbase-linux-amd64")
sha256sums=('3be10beeb845859731f10a3fa2fe2960839cf36e4e9e39ab9f533e3e3b61d2fb')
sha256sums_x86_64=('a2914cfa6c5bda21a4cf6615d720e517a69f1ed713d5c3576cf875cd0afc9450')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/perbase"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
