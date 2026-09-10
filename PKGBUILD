pkgname=zed-globalization
pkgver=1.19.2
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

sha256sums_x86_64=('b921b5c97a687fdd722b3dc465900933b2eb6501a53ef09c90b66384e1ee4adf')
sha256sums_aarch64=('ff8ddf9db9cd84d6644ba578bd37887d1ac2ab9b06fece6e6627486ec2b53101')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/bin/zedg"
  rm -f "${pkgdir}/usr/bin/zed"
  mv "${pkgdir}/usr/share/applications/zedg.desktop" "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
  sed -i 's/^MimeType=text\/plain;$/MimeType=text\/plain;inode\/directory;/' "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"
}
