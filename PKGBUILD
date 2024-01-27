# Maintainer: Tobias Bauer <archlinux@tobias-bauer.de>
pkgname=ucx
pkgver=21.00.0.18
pkgrel=3
pkgdesc="UltraCompare is a powerful compare tool for files and folders."
arch=(x86_64)
url="https://www.ultraedit.com/products/ultracompare/"
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'libjpeg-turbo' 'libpng12' 'libsm')
install=ucx.install
source=(
  "https://downloads.ultraedit.com/main/uc/linux/tar/ucx-${pkgver}_amd64.tar.gz"
)
md5sums=(
  'e3277d6d1c792294ae17be4d9bc63405'
)
DLAGENTS=('https::/usr/bin/curl -fLC - --user-agent Lynx --retry 3 --retry-delay 3 -o %o %u')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -R "${srcdir}/ucx" "${pkgdir}/opt"
  ln -s "/opt/ucx/bin/ucx" "${pkgdir}/usr/bin/ucx"
  ln -s "/opt/ucx/share/ucx/pixmaps/ucx.png" "${pkgdir}/usr/share/pixmaps/ucx.png"
  ln -s "/opt/ucx/share/ucx/ucx.desktop" "${pkgdir}/usr/share/applications/ucx.desktop"
  ln -s "/opt/ucx/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
