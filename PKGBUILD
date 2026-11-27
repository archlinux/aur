# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bruin-bin
pkgver=0.11.839
pkgrel=1
pkgdesc="Build data pipelines with SQL and Python, ingest data from different sources, add quality checks, and build end-to-end flows"
arch=('x86_64' 'aarch64')
url="https://github.com/bruin-data/bruin"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bruin_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bruin_Linux_arm64.tar.gz")
sha256sums_x86_64=('def7887c260958af9d85be86aa08a06eb25813befcf1a4405bbe1388f797fb99')
sha256sums_aarch64=('ddea2eeff1b4c52606e77a9d73726bf3d976b6be9c7c289034b439035225a5ea')

package() {
  install -Dm755 "bruin" "${pkgdir}/usr/bin/bruin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
