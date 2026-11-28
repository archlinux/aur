# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sloglint-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Ensure consistent code style when using log/slog"
arch=('x86_64' 'aarch64')
url="https://github.com/go-simpler/sloglint"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sloglint_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sloglint_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('250385cbbf517809dc352ccbb8d44ca8f9ab1f9eb18b1fbf92c5f6f76aeaa41a')
sha256sums_aarch64=('ac7aad2234f2375200dc4e06ca2eecac565be184a7ffdf39739e20ccb999b52d')

package() {
  install -Dm755 "sloglint" "${pkgdir}/usr/bin/sloglint"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
