# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-megasync"
pkgver="2.7.1"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync')
provides=("${pkgname}")

source_i686=("https://mega.nz/linux/MEGAsync/Debian_8.0/i386/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://mega.nz/linux/MEGAsync/Debian_8.0/amd64/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('6efa3f8008ffae35972e6d2b9646402934a473864775a309ab6f43d2861d6a28')
sha256sums_x86_64=('8acdaddcd4ba6466f73801efa4d41d0f395c62e6fc80c78f76f12f243eda8ac6')

install="${pkgname}.install"

package() {
	cd "${srcdir}"
	ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr
	
    cd "${pkgdir}"
	rm -rf ./usr/src && rm -rf ./usr/share/doc
}

# vim:set ts=4 sw=2 ft=sh et: