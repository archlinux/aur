pkgname=zed-globalization
pkgver=1.18.0
pkgrel=3
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/x6nux/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
provides=('zedg' 'zed')
conflicts=('zedg' 'zed')
options=('!debug')

source_x86_64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('0e3ddba38908a1b5d8f305c94cc3c30af6af7ab92d5906389884560d06763b29')
sha256sums_aarch64=('add9d8af05e38f156cbc091023bfe5423519364670e20db36b13496ebf41cc5c')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/share/applications/zedg.desktop" "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
