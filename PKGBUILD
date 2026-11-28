# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=alcless-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight security sandbox for Homebrew, AI agents and more"
arch=('x86_64' 'aarch64')
url="https://github.com/AkihiroSuda/alcless"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/AkihiroSuda/alcless/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/alcless-${pkgver}-Linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/alcless-${pkgver}-Linux-aarch64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('7666c8fe59c2654b149508f22ffdb6331d77969e775c2bab269ae2a9e33ecd0f')
sha256sums_aarch64=('49ec252459d49b3bae5d1560076e0020f6e2b91bd6edcd61272836befbb82e19')

package() {
  install -Dm755 "./bin/alclessctl" "${pkgdir}/usr/bin/alclessctl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
