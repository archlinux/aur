# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
_pkgver="7.0"
_pkgadditver="+dfsg-3"
pkgname=${_pkgname}-bin
pkgver=${_pkgver//\~}
pkgrel=4
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "${_pkgname}" "qemu-arm-static")
conflicts=("qemu-user" "${_pkgname}" "qemu-arm-static")

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${_pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${_pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${_pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${_pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${_pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("ca9965bd0339402e48761c7475a26614c035bfd4708caef9955f47f9aa16d8e7")
sha256sums_i686=("5e7afb9a0702e4a6843d0c50c2e39ac42d265b536469d91170b4abdd85e43a68")
sha256sums_aarch64=("0341ba977beaf5f4684de0569b76cdd5a27ed2ff11c48eaf8514e926b39abfbd")
sha256sums_armv7h=("6a5188f563d7126fbfdae9b79da19aa3ba2278b6143fa2a1e2a98a21618b6e4e")
sha256sums_armv6h=("f28f42b9607836fe6cff4b216275c2ffac52d0a625ba33d4acab7a93d4042579")

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
