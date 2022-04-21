
# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
_pkgver="7.0~rc4"
_pkgadditver="+dfsg-1"
pkgname=${_pkgname}-bin
pkgver=${_pkgver//\~}
pkgrel=1
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

sha256sums_x86_64=("3ab434ec35432862333462410b257319eb2391b23ea01d7ac94d8bd04758a65f")
sha256sums_i686=("83a1cd9609d879e740f2387ddb31c44b1e77d966bd8eb6b4df38e76db8e7b77b")
sha256sums_aarch64=("92141e99dd8456c9f15de5b4b8722f89df620d3d4f737185fb4c69f699ca3632")
sha256sums_armv7h=("2a39627f9ba5ba93600621f5d5931888631f0cdaf74f88b18096553da96e6855")
sha256sums_armv6h=("a1b3767b73fe5dd1edfa843afce4835367793219475eccbef7bfd5e9f4155fa4")

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
