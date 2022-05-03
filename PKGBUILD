
# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
_pkgver="7.0"
_pkgadditver="+dfsg-2"
pkgname=${_pkgname}-bin
pkgver=${_pkgver//\~}
pkgrel=2
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

sha256sums_x86_64=("a2780b7143eeab5e3553e9d1320bf85ed55b2c6def4f8d57d509d6f49d4d22d6")
sha256sums_i686=("4e0da5ca8044b4e32ddc70ba63bdb11a1e5e79998d44784b85822426c975d661")
sha256sums_aarch64=("911209ad0563c41676fa11baf01d599ccbc52e87f6c64b10a0d9d07a86dd0c45")
sha256sums_armv7h=("324a2872a24434eafc29ba96d2dbb974bb878e68ee1e256219f0c7690d1ed9b1")
sha256sums_armv6h=("db18436d1c0879bd5d4f58e5d96f871ba1dbff1df3cc63088a65447e012c5314")

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
