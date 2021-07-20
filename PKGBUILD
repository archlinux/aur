# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=$_pkgname-bin
pkgver=5.2
pkgrel=10
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "$_pkgname")
conflicts=("qemu-user" "$_pkgname")

_pkgadditver="+dfsg-11"
# case "${CARCH}" in
#	"")_pkgadditver="+dfsg-sth-else"
# esac

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("f568c1cb5f4c4e08991e8ce5892d9c35ff76c609f19696bdcfcbe56d806f7982")
sha256sums_i686=("43e9c18babbcb85159a0c7803694b41ee1773caac4af0a20102dc91eced56da0")
sha256sums_aarch64=("be0aaac49118a33470b5fc99b1d266fecef329370363d840720f65d7c7a6fad7")
sha256sums_armv7h=("d61fc2da2b3d8f5069dff55173e9768aad06206ac93c9ea88a3e67877515d5b7")
sha256sums_armv6h=("21ae0b264e98ea66110857df645c7c172e7dd6107fc176588288b3a9e27d81ab")

package() {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
