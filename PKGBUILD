# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wp2hugo-bin
pkgver=1.40.0
pkgrel=1
pkgdesc="Migrate WordPress sites to Hugo"
arch=('x86_64' 'aarch64')
url="https://github.com/ashishb/wp2hugo"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wp2hugo_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wp2hugo_Linux_arm64.tar.gz")
sha256sums_x86_64=('f55b5191229836c99980b119d0b2fa0aaca7e62445902f524a2caa8361105ec9')
sha256sums_aarch64=('d6ba70e2f5965259b835d2b3d9c7bda19823eed5dd5e85c916f67b0b9b735675')

package() {
  install -Dm755 "wp2hugo" "${pkgdir}/usr/bin/wp2hugo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
