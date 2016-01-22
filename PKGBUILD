# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-megasync"
pkgver="2.6.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync')
provides=("${pkgname}")

source_i686=("https://mega.nz/linux/MEGAsync/Debian_8.0/i386/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://mega.nz/linux/MEGAsync/Debian_8.0/amd64/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('85c8c3078e6cbc72b7d740408adb221776a8a7d31626f144ac383c859fce6010')
sha256sums_x86_64=('63a7dc3f5719a9b68159afaf7042bf3594c0ae7b28b1d83fae020a0a293a13cc')

install="${pkgname}.install"

package() {
	cd "${srcdir}"
	ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr
	
    cd "${pkgdir}"
	rm -rf ./usr/src && rm -rf ./usr/share/doc
}

# vim:set ts=4 sw=2 ft=sh et:
