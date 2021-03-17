# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=$_pkgname-bin
pkgver=5.2
pkgrel=5
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "$_pkgname")
conflicts=("qemu-user" "$_pkgname")

_pkgadditver="+dfsg-8"
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

_pkgadditver="+dfsg-9"
source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")

sha256sums_x86_64=("a3b74bc11b3ae2d9be96e9a013cbd3546ca9aa9c4ed9e95ab2d9945d32e7c2c4")
sha256sums_i686=("d7a8c166f0b5cf00e8aa1517bec5a420a5ce1a5b053919841d016b0c014aaa56")
sha256sums_aarch64=("7dadc7a82aaee50bf2f9c9a90ede89ef9d13a6bddf00a4ca00128a29639e60f8")
sha256sums_armv7h=("64c838f401913f56345dc084716ae78945721760dda124e4adca0fad0a892047")
sha256sums_armv6h=("ce920e7c532e090c46d78d2fbd370eaa40400078d929dfaecd0efa9dda686816")

package() {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz" ./usr/bin ./usr/share/man
	rm -r ./usr/share/man/man1/qemu-debootstrap.1.gz
}
