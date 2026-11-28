# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=engraph-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Local knowledge graph for AI agents"
arch=('x86_64')
url="https://github.com/devwhodevs/engraph"
license=('MIT')
depends=('glibc' 'libgcc' 'libgomp' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/devwhodevs/engraph/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/engraph-linux-x86_64.tar.gz")
sha256sums=('f41ff89c13b823de1d255e5cb885752b0f576b01737baed0c54144345045cff9')
sha256sums_x86_64=('3942d553d82c8f7587d76f8a942562d04716726531538262761fb663fd8c14ab')

package() {
  install -Dm755 "engraph" "${pkgdir}/usr/bin/engraph"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
