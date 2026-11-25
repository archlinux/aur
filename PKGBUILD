# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ofelia-bin
pkgver=0.3.23
pkgrel=1
pkgdesc="A docker job scheduler (aka"
arch=('x86_64' 'aarch64')
url="https://github.com/mcuadros/ofelia"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ofelia_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ofelia_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('63887c087113705051b207405c2aca1fe09d866a5cf4d7a08f6df6838bc0752d')
sha256sums_aarch64=('01e405135d0a726143da94989d6062005f8fd10d291df1392261c05f147261c3')

package() {
  install -Dm755 "ofelia" "${pkgdir}/usr/bin/ofelia"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
