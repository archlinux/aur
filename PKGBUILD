# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nix-auth-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Nix access token management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/numtide/nix-auth"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nix-auth_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nix-auth_Linux_arm64.tar.gz")
sha256sums_x86_64=('ac20a2daa9f0dbfdd5c11f4b2e818c38516f795816d69fce55d62d2992e8d07d')
sha256sums_aarch64=('03832fb3eadce58947c1e14eaf05aa85654a4589a49a7dd4e3fe8417d67bc47c')

package() {
  install -Dm755 "nix-auth" "${pkgdir}/usr/bin/nix-auth"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
