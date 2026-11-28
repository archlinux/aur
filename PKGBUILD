# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sshub-bin
pkgver=0.22.3
pkgrel=1
pkgdesc="Terminal UI for SSH with host database, SFTP browser, tunnels and key management"
arch=('x86_64')
url="https://github.com/Petyok/SSHub"
license=('AGPL-3.0-only')
depends=('dbus' 'glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Petyok/SSHub/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sshub-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d8a6cc31abc16b6748c7a21f21611f5a1ec33f67d22ca23d7da1c19b95496bee')
sha256sums_x86_64=('0a82dc22a84f772cff00fdb8575bff4fdad32626ebba4694c5266eba47ebef49')

package() {
  install -Dm755 "sshub" "${pkgdir}/usr/bin/sshub"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
