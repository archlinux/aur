# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-megasync"
pkgver="2.1.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync')
provides=("${pkgname}")

source_i686=("https://mega.co.nz/linux/MEGAsync/Debian_8.0/i386/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://mega.co.nz/linux/MEGAsync/Debian_8.0/amd64/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('12094a1b0bdccdf2bf6a75c1d80c162ba6b5c344e439ca2d82cfe6befe80ee28')
sha256sums_x86_64=('06470c7e342c474d9a87afa1a7cdef2d14fc5e2bcd18d61438edb23718c0dbe1')

install="${pkgname}.install"

package() {
	cd "${srcdir}"
	ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr
	
    cd "${pkgdir}"
	rm -rf ./usr/src && rm -rf ./usr/share/doc
}

# vim:set ts=4 sw=2 ft=sh et:
