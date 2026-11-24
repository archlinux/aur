# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=drako-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Grid-based command-deck launcher for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/lucky7xz/drako"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/drako_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/drako_Linux_arm64.tar.gz")
sha256sums_x86_64=('7f143907844194610a9c33709bf2e9a969d4c55debb04e5090b8d38e20f6aff9')
sha256sums_aarch64=('c023e43b306b7df81deb51333492db8ba2523bfb2fd89710ea9498654a4d5922')

package() {
  install -Dm755 "drako" "${pkgdir}/usr/bin/drako"
  install -Dm644 "LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
