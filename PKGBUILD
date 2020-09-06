# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=parsify-desktop
pkgver=1.2.2
pkgrel=1
pkgdesc="Extendable calculator for the 21st Century"
arch=('x86_64')
url='https://parsify.app'
license=('MIT')
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/parsify-dev/desktop/releases/download/v${pkgver}/parsify-desktop_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/parsify-dev/desktop/raw/master/license')
sha256sums=('2c192cf1b33976158a09612056ab08957e7987f5720b0a5043d9457d4b3e83df'
            '96a0f4a1f2e3895c759a26d58660499af0eeb342f9f929e4a6f0c14997449866')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  cd "${pkgdir}/usr/share/icons/hicolor/"
  mv 0x0 512x512
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}