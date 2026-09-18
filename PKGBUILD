pkgname=zed-globalization
pkgver=1.20.2
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

sha256sums_x86_64=('18c5e3fc19dd30835aecd8f0343b583ab43f1cf9f6782b9b0f4e1d35f8e990c4')
sha256sums_aarch64=('3428ad39fb6c0ee70d341ff3598cbc9ad7f75ee8db2adcacce02fb37706ad19c')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/share/applications/zedg.desktop" "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i 's/^MimeType=text\/plain;$/MimeType=text\/plain;inode\/directory;/' "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
