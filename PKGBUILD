# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=qbittorrent-cli
pkgver=1.7.22315.1
pkgrel=1
pkgdesc='Command line interface for QBittorrent '
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
depends=('dotnet-runtime>=6.0')
source_x86_64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-x64-net6-${pkgver}.tar.gz")
source_arm=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm-net6-${pkgver}.tar.gz")
source_aarch64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm64-net6-${pkgver}.tar.gz")
sha256sums_x86_64=('86852eb70f45e0c5e25f6bb663a2015810b908c2101f199b0798d50dbbf99fd2')
sha256sums_arm=('7644acbd0b7075a0fabab5a8f49d673da3e2ae64d86b819934fc621972c4e857')
sha256sums_aarch64=('7a8274c796c7132fea1dc5d9974588f8ab19632fe5040ac531486524fc7a6ba5')
options=('!strip')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" qbt createdump
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" *.json *.so *.dll

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/qbt" "${pkgdir}/usr/bin/qbt"
}
