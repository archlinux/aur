# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stegodon-bin
pkgver=1.8.6
pkgrel=1
pkgdesc="Blogging platform you use over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/deemkeen/stegodon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stegodon_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/stegodon_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('a8d859021f5f27f7952feee2684e72f183b703b33185021255d6ecf5ba04e00a')
sha256sums_aarch64=('20769f93d19763810aa71177fd4945b95b17f51c3959c8b3d6ef577d49674a33')

package() {
  install -Dm755 "stegodon" "${pkgdir}/usr/bin/stegodon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
