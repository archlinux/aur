# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gremlins-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Mutation testing for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/go-gremlins/gremlins"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gremlins_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gremlins_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b02a42e47935f891c9a411d68c07e211c7082609e79c2435b67c85ee9658c538')
sha256sums_aarch64=('686542674e54559afb7e86d6994d342c19a856cfd970c315748989537936664c')

package() {
  install -Dm755 "gremlins" "${pkgdir}/usr/bin/gremlins"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
