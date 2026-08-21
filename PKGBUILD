# Maintainer: solxix

pkgname=minecrauth-bin
_name=${pkgname%-bin}
pkgver=0.2.0
pkgrel=1
pkgdesc="A self-hosted Yggdrasil authentication server for Minecraft Java Edition with skins and capes."
arch=('x86_64' 'aarch64')
url="https://github.com/achetronic/minecrauth"
license=('Apache-2.0')
depends=('')
optdepends=('')
source_x86_64=("${_name}-${pkgver}_x86_64.tar.gz::https://github.com/achetronic/minecrauth/releases/download/v${pkgver}/minecrauth_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}-${pkgver}_aarch64.tar.gz::https://github.com/achetronic/minecrauth/releases/download/v${pkgver}/minecrauth_${pkgver}_linux_arm64.tar.gz")
conflicts=('minecrauth')
b2sums_x86_64=('SKIP')
b2sums_aarch64=('SKIP')

package() {
    install -Dm755 "$_name-$pkgver-$CARCH/minecrauth" "$pkgdir/usr/bin/minecrauth"
    install -Dm644 "$_name-$pkgver-$CARCH/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
