# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgname=${_pkgname}-bin
pkgver=6.2
pkgrel=1
pkgdesc='A generic and open source machine emulator, statically linked'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
provides=("qemu-user" "${_pkgname}")
conflicts=("qemu-user" "${_pkgname}")

_pkgadditver="+dfsg-1"
# case "${CARCH}" in
#	"")_pkgadditver="+dfsg-sth-else"
# esac

source_x86_64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_amd64.deb")
source_i686=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_i386.deb")
source_aarch64=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_arm64.deb")
source_armv7h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armhf.deb")
source_armv6h=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${_pkgadditver}_armel.deb")

sha256sums_x86_64=("95590198a480ec48fa3780803a6622889fd298c6ccdd435f92051936ba2d358c")
sha256sums_i686=("83217bdb0563405e11440997e709d26876136c8acf792c8018a5fa4ab2bd8244")
sha256sums_aarch64=("e632e50ac67cde51b1013fa3a6509dc6ff806fb0a993e5979bdcdab48271b5e4")
sha256sums_armv7h=("6486d2fa815cf413dce49b7a925f6cde1f90378043db5c4d6fe3418dc639cff5")
sha256sums_armv6h=("3bbd81e80c958918c7e5368dcbf401eed17934a2e46c17cc5e596ff94a8f496c")

package() {
	tar -C "${pkgdir}" -xf "${srcdir}/data.tar.xz" --exclude=./usr/share/man/man1/qemu-debootstrap.1.gz ./usr/bin ./usr/share/man
}
