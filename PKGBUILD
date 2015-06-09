# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-megasync"
pkgver="2.0.0"
pkgrel="2"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync')
provides=("${pkgname}")

source_i686=("https://mega.co.nz/linux/MEGAsync/Debian_8.0/i386/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://mega.co.nz/linux/MEGAsync/Debian_8.0/amd64/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('1ccd2a476f8ab384fd9a11a5a68d624c190a27459f7d10ff5da24c6c03299172')
sha256sums_x86_64=('1df5ab2c627ad160dc16f29e48c27f83b47c4fb0ff644284a6f4e466a2fd574e')

install="${pkgname}.install"

package() {
	cd "${srcdir}"
	ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr
	
    cd "${pkgdir}"
	rm -rf ./usr/src && rm -rf ./usr/share/doc
}

# vim:set ts=4 sw=2 ft=sh et:
