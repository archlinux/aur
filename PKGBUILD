# Maintainer: naka <weedeadpixels@gmail.com>

pkgname=premid
_pkgname=premid
pkgver=2.0.1.2
pkgrel=1
pkgdesc="PreMiD adds Discord Rich Presence support to a lot of services you use and love."
arch=('x86_64')
url='https://premid.app'
license=('MIT')
depends=()
optdepends=()

source=("http://naka.wtf/aur/${pkgname}-${pkgver}.tar.gz")
sha512sums=('04557cc1e8649bc9a5cb1bf8a8037ea22d8d2029ce5cc42c7a27f990d7b1df91b52d1e4ddb9fa7714f7f1412e49a35e027ec8e57c3ee9f898317550b8d2d7d49')



package() {

  install -d "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname


  # Icons
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/premid.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"


  # Desktop Entry
  install -Dm644 "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  mkdir -p ${pkgdir}/usr/bin/
  ln -sf /opt/premid/premid  "${pkgdir}/usr/bin/premid"

  # Libs
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/swiftshader/libGLESv2.so

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}