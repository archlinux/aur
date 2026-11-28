# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cclens-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Inspect your Claude Code usage"
arch=('x86_64' 'aarch64')
url="https://github.com/lambdalisue/cclens"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lambdalisue/cclens/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cclens-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cclens-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('b33f1865cc7966843924cc0dfec6acf95f52da6a1a4d355d6a6b26f43b924511')
sha256sums_x86_64=('073d74433279d7a5516f656a9bc0030471a5852aba405b87df3a8e9609319c06')
sha256sums_aarch64=('48a593c1ce996baa40f685d902a2c1d96080db8d093d2539bcdd8ef253441794')

package() {
  install -Dm755 "cclens" "${pkgdir}/usr/bin/cclens"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
