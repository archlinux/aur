# Maintainer: 
pkgname='trueconf'
pkgver='7.3.4.230'
pkgrel='2'
pkgdesc='Video conference client with a range of rich collaborative tools and an easy-to-use interface'
arch=('x86_64')
url="https://${pkgname}.com"
license=('custom:trueconf-client')
depends=('bzip2' 'curl' 'dbus' 'glib2' 'icu' 'lame' 'libglvnd' 'libidn' 'libphonenumber'
'libsystemd' 'libx11' 'libxcb' 'libxext' 'libxrandr' 'openssl-1.0' 'protobuf'
'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'speex' 'speexdsp' 'sqlite'
'v4l-utils' 'zeromq' 'zlib' 'systemd')
optdepends=('pulseaudio: audio support with pulseaudio')
makedepends=('libarchive')
install="${pkgname}-client.install"
_channel=stable
source=("${url}/download/${pkgname}_client_arch_x86_64.pkg.tar.xz"
        "${pkgname}.desktop"
        "${pkgname}-client.sh"
        "${pkgname}-client-autostart.sh"
        )
sha1sums=('5645d101e68b9c1c00e9c1d6e39e8aba9fe16643'
          '9fdfaf3ad3ead18be09a4dea306347369e47e4c1'
          '830c54f74be17071bc7ae58e15f8810cefd65910'
          'c916985ed95004a15eb1c84c59f3ca313f5ea3be'          
          )

package() {
  install -Dm775 "${pkgname}-client.sh" "${pkgdir}/opt/${pkgname}/${pkgname}-client"
  install -Dm775 "${pkgname}-client-autostart.sh" "${pkgdir}/opt/${pkgname}/${pkgname}-client-autostart"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -ax "usr" "${pkgdir}"
  cp -ax "opt" "${pkgdir}"
}
