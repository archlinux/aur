# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pzmod-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Terminal app and CLI for managing Project Zomboid dedicated-server mods"
arch=('x86_64' 'aarch64')
url="https://github.com/kldzj/pzmod"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kldzj/pzmod/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pzmod_linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/pzmod_linux_arm64")
sha256sums=('d50e3fbebd7e867e540e6809b5ff7f0c9e8254872694ead779985879173f0d5b')
sha256sums_x86_64=('44adb886ab8a76b768f1264b1d924c2e91600dedcf76b91dfcacc7b205ca4b2d')
sha256sums_aarch64=('5d8d0b7e22a116f596a0272fd58290c15c51438fbd7a85709165130bceec7cbb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pzmod"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
