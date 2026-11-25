# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opensrc-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Fetch source code for npm packages to give AI coding agents deeper context"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/opensrc"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vercel-labs/opensrc/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/opensrc-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/opensrc-linux-arm64")
sha256sums=('014bb31e83d5c2e76aea1cc6e82217346ab41362f32cb355ad0f5c10aa0aeaff')
sha256sums_x86_64=('2f472269c2c05e56d098c967be9a78efa9c2d23389b293ee3dec942d6f62c882')
sha256sums_aarch64=('a69c98845cb65f3558239e985830d740db67a1ef8853742cc983157080a182bc')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/opensrc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
