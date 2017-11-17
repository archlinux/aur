# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='trueconf'
pkgver='1.3.1.1038'
pkgrel='1'
pkgdesc='Video conference client'
arch=('x86_64')
url="https://${pkgname}.ru"
license=('freeware')
depends=('libxslt' 'v4l-utils' 'sqlite' 'gtk2' 'openssl' 'gstreamer0.10')
optdepends=('pulseaudio: audio support with pulseaudio'
	    'apulse-git: audio support without pulseaudio')
makedepends=('libarchive')
source=("${url}/download/${pkgname}-client-amd64.pkg.tar.xz"
	"${pkgname}.desktop")
sha256sums=('d077e5ea44e31968052d98f9c08e383275985b62b9372b0be97826389fce09a7'
            'e57c0c5c0e4b1be5b11108df5245f3035c7cd4b492de9e014a14b3871f1cddaf')
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
