# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=21.00.0.0
pkgrel=2
pkgdesc="UltraEdit is a powerful text editor."
arch=('x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'webkit2gtk' 'libjpeg' 'libjpeg6' 'libpng' 'libsm')
source=(https://downloads.ultraedit.com/main/ue/linux/tar/uex_${pkgver}_amd64.tar.gz)
sha256sums=('b88def7d1965cffa26531f895ee9940f89f5072901e7325555911df42f2498df')
DLAGENTS=('https::/usr/bin/curl -fLC - --user-agent Lynx --retry 3 --retry-delay 3 -o %o %u')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -R "${srcdir}/uex" "${pkgdir}/opt"
  ln -s "/opt/uex/bin/uex" "${pkgdir}/usr/bin/uex"
  ln -s "/opt/uex/share/uex/ue.png" "${pkgdir}/usr/share/pixmaps/ue.png"
  ln -s "/opt/uex/share/uex/uex.desktop" "${pkgdir}/usr/share/applications/uex.desktop"
  ln -s "/opt/uex/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
