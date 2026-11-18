# Maintainer: Daniel Nilsson <git@dlnilsson.se>

pkgname=yopass-cli-bin
_pkgname=yopass
pkgver=16.2.0
pkgrel=1
pkgdesc="Yopass CLI for secure sharing of secrets, passwords and files (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jhaals/yopass"
license=('Apache-2.0')
provides=('yopass')
conflicts=('yopass')
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3cc092e09a2feb97af1e7dbab60fdc0172893907e62c7e20a187e1d3185f35c1')
sha256sums_aarch64=('6d14a5cd1de6b98097c6046f9a7e72af5172cad000e5d1af9988ed08ed6ee09d')

package() {
  install -Dm755 yopass "$pkgdir/usr/bin/yopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
