# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=$_pkgname-bin
pkgver=6.1
pkgrel=3
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "$_pkgname")
conflicts=("qemu-user" "$_pkgname")

_pkgadditver="+dfsg-5"
# case "${CARCH}" in
#	"")_pkgadditver="+dfsg-sth-else"
# esac

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("9938af871408c30c7687409184662e9de1b74617faa259d858a06e6f394e7fc9")
sha256sums_i686=("eee32e7be56959ab4779b8a50fc86a29fdb036cc2f7530acd806357ce52da544")
sha256sums_aarch64=("4b0f988056b821e708b7dac22ed7d19cdd630df637e9cd0407ec95baeb5ef946")
sha256sums_armv7h=("9dcc1ab4d1964bd579a938fc72e57bf391bc5627e1f2cab978ce14ab500e1dbf")
sha256sums_armv6h=("63ca1862f686f5775d8248e42cf5732d81b4654118592ffc7e764a9437bdff32")

package() {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
