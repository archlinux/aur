# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blogwatcher-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Track new posts on your favorite blogs"
arch=('x86_64')
url="https://github.com/Hyaxia/blogwatcher"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/blogwatcher_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('468b33612ef75f5672aa2f5c4d7c42db4c1cd4870c26027a1ec0018a91d41df5')

package() {
  install -Dm755 "blogwatcher" "${pkgdir}/usr/bin/blogwatcher"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
