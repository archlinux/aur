# Maintainer: Peter Klotz <peter.klotz99@gmail.com>
pkgname=uex
pkgver=16.1.0.17
pkgrel=1
pkgdesc="UltraEdit is a powerful text editor."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/uex.html"
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'libjpeg6' 'libpng12' 'libsm')
install=uex.install
if [ "${CARCH}" = 'i686' ]; then
  source=(http://www.ultraedit.com/files/uex/Other/uex-${pkgver}_i386.tar.gz)
  md5sums=('f8ec6f6f4c8c9da61cabd2a827837c20')
else
  source=(http://www.ultraedit.com/files/uex/Other/uex-${pkgver}_amd64.tar.gz)
  md5sums=('c8c9fd5e3af10ef16a10265f3e96776e')
fi

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -R "${srcdir}/uex" "${pkgdir}/opt"
  ln -s "/opt/uex/bin/uex" "${pkgdir}/usr/bin/uex"
  ln -s "/opt/uex/share/uex/ue.png" "${pkgdir}/usr/share/pixmaps/ue.png"
  ln -s "/opt/uex/share/uex/uex.desktop" "${pkgdir}/usr/share/applications/uex.desktop"
  ln -s "/opt/uex/share/doc/uex/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
