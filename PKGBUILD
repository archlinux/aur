# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>
# Contributor: Tobias Frisch <thejackimonster@gmail.com>

pkgname='cadet-gtk'
pkgver='0.6.1'
pkgrel=1
pkgdesc='A GTK based GUI for the CADET subsystem of GNUnet.'
url="https://gitlab.com/gnunet-messenger/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gtk3' 'libhandy' 'gnunet' 'jansson' 'libnotify')
conflicts=("${pkgname}-git")
source=("https://gitlab.com/gnunet-messenger/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('d30adf5fc3ee7a8a1536e0358e16a201b688cb31eb78e62f84e94e30092e7f22')

build() {

	cd "${srcdir}/${pkgname}-v${pkgver}"
	sh build.sh "release"

}

package() {

	cd "${srcdir}/${pkgname}-v${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	
	install -Dm644 "resources/icon/full_color_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm644 "resources/icon/full_color_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	install -Dm644 "resources/icon/full_color_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 "resources/icon/full_color_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -Dm644 "resources/icon/full_color_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

