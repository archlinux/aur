# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wakaru-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="JavaScript decompiler for modern frontend bundles"
arch=('x86_64' 'aarch64')
url="https://github.com/pionxzh/wakaru"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pionxzh/wakaru/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wakaru-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wakaru-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('f2cdb6a2bde843c929dab56586f63f5ea3fe9d6d91748cbc58d603f570a4a91a')
sha256sums_aarch64=('efdbeba7e93e8d6d48bf02d584758229b9963c474d31e9564e78b514916df18b')

package() {
  install -Dm755 "wakaru" "${pkgdir}/usr/bin/wakaru"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
