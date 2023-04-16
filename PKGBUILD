# Contributor: xannode <archpkg _at_ xannode.com>
pkgname=itgmania-bin
pkgver=0.6.1
pkgrel=2
pkgdesc="A fork of stepmania 5.1, improved for the post-ITG community"
provides=('itgmania')
conflicts=('itgmania')
arch=('x86_64')
url="https://www.itgmania.com/"
options=(!strip)
license=('MIT')
depends=(flac libvorbis mpg123 opusfile icu libxau sqlite libxml2 libpng libjpeg-turbo libtiff gtk3 libusb-compat)
source=(
	"https://github.com/itgmania/itgmania/releases/download/v${pkgver}/ITGmania-${pkgver}-Linux.tar.gz"
	"itgmania.sh"
)
sha256sums=('e026fb9f9cf11b7a4e199d92f9ca4e0565a49d527a3c7fba14afad2ce8470e62'
            '0249497c6eb7969362d8a93e1bb50c3259e5dc3873f8c94a40503d1321f03810')

package() {
	install -dm755 "${pkgdir}/opt/"
	cp -r "ITGmania-${pkgver}-Linux/itgmania" "${pkgdir}/opt/itgmania"
  	install -dm755 "${pkgdir}/usr/bin"
	install -D -m755 "itgmania.sh" "${pkgdir}/usr/bin/itgmania"
	install -D -m644 "ITGmania-${pkgver}-Linux/itgmania/itgmania.desktop" \
	    "${pkgdir}/usr/share/applications/itgmania.desktop"
}

#  vim: set ts=8 sw=8 tw=0 noet :
