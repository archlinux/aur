# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=parsify-desktop
pkgver=1.2.1
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
sha256sums=('ad8d2ab4bfd145a4326704ea56f8d020dd805aa90315eefa0f1b41a45e019ee0'
            '96a0f4a1f2e3895c759a26d58660499af0eeb342f9f929e4a6f0c14997449866')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  cd "${pkgdir}/usr/share/icons/hicolor/"
  mv 0x0 512x512
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}