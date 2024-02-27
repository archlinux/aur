# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok-bin
pkgver=0.4.25
pkgrel=1
pkgdesc='An open source sharing solution built on OpenZiti'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/openziti/zrok'
license=('Apache')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-linux-armv7.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('1934668e6571ece30a71bc7cbfdf8c30cd91ed8ea996f8b947407c23f5a29633')
sha256sums_aarch64=('932b584fc128aafbedffca1d1ceb3c8bc52d764a2f0902f2401d81e0ff5eaed4')
sha256sums_armv7h=('a804e26c8e5262c71812d5a7997859ccac1a25d2aa4411cd349a9a9d3ce1c191')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
