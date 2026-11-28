# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lade-bin
pkgver=0.20.2
pkgrel=1
pkgdesc="Temporary access to secrets and private networks for a single command"
arch=('x86_64' 'aarch64')
url="https://github.com/zifeo/lade"
license=('MPL-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zifeo/lade/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('b699a07a3a615290429c86b8bf72fade40a15ddc8aae90a6a2046d60209c730e')
sha256sums_aarch64=('ca604e7759dcb4bdd09fe064b488b1b2e57a6d686bbd970ad29210a15c604c5d')

package() {
  install -Dm755 "lade" "${pkgdir}/usr/bin/lade"
  install -Dm755 "age-plugin-lade" "${pkgdir}/usr/bin/age-plugin-lade"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
