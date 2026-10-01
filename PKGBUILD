pkgname=zed-globalization
pkgver=1.22.0
pkgrel=1
pkgdesc="Zed editor with globalization support (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/x6nux/zed-globalization"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'GPL-3.0-or-later')
provides=('zedg' 'zed')
conflicts=('zedg' 'zed')
options=('!debug')

source_x86_64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/x6nux/zed-globalization/releases/download/v${pkgver}/zedg-zh-cn-linux-aarch64-v${pkgver}.tar.gz")

sha256sums_x86_64=('63bb44cf4450a63257458ba698237fe10d62a8924239a67f7b6752dd58e3a574')
sha256sums_aarch64=('6502955a11240245244d9bf5add8a898d53bb6c199d21a48ea8835c42e754705')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/share/applications/zedg.desktop" "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i 's/^MimeType=text\/plain;$/MimeType=text\/plain;inode\/directory;/' "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
