# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=23.0.0.21
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('LicenseRef-UltraEditCustomLicense')
depends=('cairo' 'desktop-file-utils' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gcc-libs' 'gtk3' 'libjpeg' 'libjpeg6' 'libnghttp2' 'libpng' 'libsm' 'libtiff' 'libx11' 'pango' 'webkit2gtk-4.1' 'zstd')
source=(https://downloads.ultraedit.com/main/ue/linux/ubuntu/24.04/uex_${pkgver}_amd64.tar.gz)
sha256sums=('884509b01fee0df22f89709057dbb9ec94a35872af2655598ec44c6bff69310e')
DLAGENTS=('https::/usr/bin/curl -fLC - --user-agent Lynx --retry 3 --retry-delay 3 -o %o %u')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -R "${srcdir}/uex" "${pkgdir}/opt"
  ln -s "/opt/uex/bin/uex" "${pkgdir}/usr/bin/uex"
  ln -s "/opt/uex/share/uex/ue.png" "${pkgdir}/usr/share/pixmaps/ue.png"
  ln -s "/opt/uex/share/uex/uex.desktop" "${pkgdir}/usr/share/applications/uex.desktop"
  ln -s "/opt/uex/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
