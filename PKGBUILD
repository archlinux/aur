# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=$_pkgname-bin
pkgver=5.2
pkgrel=9
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "$_pkgname")
conflicts=("qemu-user" "$_pkgname")

_pkgadditver="+dfsg-10+b2"
# case "${CARCH}" in
#	"")_pkgadditver="+dfsg-sth-else"
# esac

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("57eacf80fc1c464645d92169307aab4c3e311c19c7f620a2586d675c6a3914ea")
sha256sums_i686=("ffb2fe24f7f1f37e05906bd8bffeba17efb0f187f506d53fdfd32dac31929fb6")
sha256sums_aarch64=("256c3f0571554409166f3e42d3e7af379c91501e260b5a9253f360745af6a7bf")
sha256sums_armv7h=("8881918e705e632a9ec0070009564d76cc85e6ce98f01a301f8a73033f2d0d6e")
sha256sums_armv6h=("4c2817465d898b8e08fcfe2939e746a88d1179b769930353d1f5cecee8af7d4f")

package() {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
