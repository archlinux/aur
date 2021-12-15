# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=$_pkgname-bin
pkgver=6.1
pkgrel=7
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "$_pkgname")
conflicts=("qemu-user" "$_pkgname")

_pkgadditver="+dfsg-8+b2"
# case "${CARCH}" in
#	"")_pkgadditver="+dfsg-sth-else"
# esac

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("917e0bed044374bda4607c07dc5b28614176397c7c10025f67e88adb7c9a8e92")
sha256sums_i686=("add7d26016c5c0a2a28d58dd0b7dad1cadc2df5bf5bc0489dc634e2c6038caa3")
sha256sums_aarch64=("b3aa30eefd51d7c37d6f12b95a595ea84e5326c1d41eb6979cc78a5061b2d754")
sha256sums_armv7h=("aace823e6d6802d31d9e46d35149e1e8ca2ba9e018cce07d7823c9e3abed87af")
sha256sums_armv6h=("63a796fd3555d6e5ccc5e7bcde366b046c1ca35b04a1d72fc8574144b986b660")

package() {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
