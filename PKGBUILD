# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='trueconf'
pkgver='7.3.4.72'
pkgrel='2'
pkgdesc='Video conference client'
arch=('x86_64')
url="https://${pkgname}.ru"
license=('freeware')
depends=('cppdb' 'bzip2' 'curl' 'dbus' 'glib2' 'icu' 'lame' 'libglvnd' 'libidn' 'libphonenumber'
'libsystemd' 'libx11' 'libxcb' 'libxext' 'libxrandr' 'openssl-1.0' 'protobuf'
'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'speex' 'speexdsp' 'sqlite'
'v4l-utils' 'zeromq' 'zlib' 'systemd')
optdepends=('pulseaudio: audio support with pulseaudio'
	    'apulse-git: audio support without pulseaudio')
makedepends=('libarchive')
source=("${url}/download/${pkgname}_client_arch_x86_64.pkg.tar.xz"
	"${pkgname}.desktop")
sha256sums=('e2aa01d7ceb1908a4e074d048b4bcca3447e7c5061a091331bc78fc3a7c91de5'
            'f0f0457d608f985dca6d7e9256460c216ea9a389c13278fcc37f9ffdc2e7d9a0')
install="${pkgname}.install"

build() {
  cd "${srcdir}"
  rm -rf "usr/share/menu"
  install -Dm644 "opt/${pkgname}/${pkgname}.desktop" "usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" "usr/share/applications/${pkgname}-apulse.desktop"
  rm "opt/${pkgname}/${pkgname}-autostart.desktop" "opt/${pkgname}/${pkgname}-client-autostart" "opt/${pkgname}/${pkgname}.desktop"
}

package() {
  cp -ax "usr" "${pkgdir}"
  cp -ax "opt" "${pkgdir}"
}
