# Maintainer: Valentin <tarasov@trueconf.ru>
pkgbase='trueconf-client'
pkgname='trueconf'
pkgver='7.5.1.27'
pkgrel='1'
pkgdesc='Video conference client with a range of rich collaborative tools and an easy-to-use interface'
arch=('x86_64')
url="https://trueconf.com"
license=('custom:trueconf')
depends=('alsa-utils' 'bzip2' 'curl' 'dbus' 'glib2' 'icu' 'lame' 'libglvnd' 'libidn' 'libphonenumber'
'libsystemd' 'libx11' 'libxcb' 'libxext' 'libxrandr' 'protobuf' 
'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'speex' 'speexdsp' 'sqlite'
'v4l-utils' 'zeromq' 'zlib' 'systemd')
optdepends=('pulseaudio: audio support with pulseaudio')
makedepends=('libarchive')
install="${pkgname}-client.install"
_channel=stable
source=("${url}/download/${pkgname}_client_arch_x86_64.pkg.tar.xz")
sha256sums=('16434ec7cbabb8a308d082f457caeda5c631e9dca02f3f589c50af5c9419d4e3')

package() {
  install -Dm 755 "${srcdir}/opt/${pkgname}/TrueConf" "${pkgdir}/opt/${pkgname}/TrueConf"
  install -Dm 755 "${srcdir}/opt/${pkgname}/${pkgname}-client" "${pkgdir}/opt/${pkgname}/${pkgname}-client"
  install -Dm 755 "${srcdir}/opt/${pkgname}/${pkgname}-client-autostart" "${pkgdir}/opt/${pkgname}/${pkgname}-client-autostart"
  install -Dm 644 "${srcdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  install -Dm 644 "${srcdir}/opt/${pkgname}/${pkgname}-autostart.desktop" "${pkgdir}/opt/${pkgname}/${pkgname}-autostart.desktop"  
  install -Dm 644 "${srcdir}/opt/${pkgname}/plugins/gui/libLinuxNotifications.so" "${pkgdir}/opt/${pkgname}/plugins/gui/libLinuxNotifications.so"
  install -Dm 644 "${srcdir}/usr/share/appdata/${pkgname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
  install -Dm 644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "${srcdir}/usr/share/menu/${pkgname}" "${pkgdir}/usr/share/menu/${pkgname}"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm 644 "${srcdir}/usr/share/pixmaps/${pkgname}16.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}16.xpm"
  cp -r "${srcdir}/opt/${pkgname}/lib" "${pkgdir}/opt/${pkgname}/"  
  cp -r "${srcdir}/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
}
