pkgname=gephgui-wry-bin
pkgver=5.0.2
pkgrel=1
pkgdesc="The command-line Geph5 client"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
download_url="https://github.com/geph-official/gephgui-pkg/releases/download"
license=('MPL-2.0')
provides=('gephgui-wry')
conflicts=('gephgui-wry')
depends=('webkit2gtk-4.1')
source=(
  "gephgui-wry-bin-5.0.2.deb::$download_url/v$pkgver/gephgui-wry_${pkgver}_amd64.deb"
  "geph.png::https://raw.githubusercontent.com/geph-official/gephgui-pkg/refs/heads/master/flatpak/icons/256x256/apps/io.geph.GephGui.png"
)
md5sums=('a6a8a0053c3502fc847321a6bca3906b'
         '4655e64a5d56c316383e1ffa79ddc772')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "$pkgdir"

  install -Dm644 "${srcdir}/geph.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/geph.png"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -exec chmod 644 {} +
}

