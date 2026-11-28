# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sugt-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Local AI gateway and skills console"
arch=('x86_64' 'aarch64')
url="https://github.com/lsuen/sugt"
license=('Apache-2.0')
depends=('dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lsuen/sugt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/SUTAI-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/SUTAI-linux-arm64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('c927e644c302f936e61309de81524b5cafe428fe7ebd8e5c7444c01d1e8cbd60')
sha256sums_aarch64=('4693e06569d8c8a6f94d3d502fa07468d48dc5cdcb19adb9b4778774f8dea7bb')

package() {
  install -Dm755 "sugt-cli" "${pkgdir}/usr/bin/sugt-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
