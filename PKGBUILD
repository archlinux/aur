# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("qemu-user-static-deb")
pkgver=2.7+dfsg_3~bpo8+2
pkgrel=1
_postfix=2.7+dfsg-3~bpo8+2
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation, statically linked."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="http://wiki.qemu.org/Index.html"
license=("GPL2" "LGPL2.1")
provides=("qemu-user-static" "qemu-static")
conflicts=("qemu-user-static" "qemu-static")
case "${CARCH}" in
	"i686")
		_deb="qemu-user-static_${_postfix}_i386.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
	"x86_64")
		_deb="qemu-user-static_${_postfix}_amd64.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
	"arm")
		_deb="qemu-user-static_${_postfix}_armel.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
	"armv6h")
		_deb="qemu-user-static_${_postfix}_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
	"armv7h")
		_deb="qemu-user-static_${_postfix}_armhf.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
	"aarch64")
		_deb="qemu-user-static_${_postfix}_arm64.deb"
		source+=("http://ftp.debian.org/debian/pool/main/q/qemu/${_deb}")
		md5sums+=("SKIP")
		;;
esac

prepare() {
	cd "${srcdir}"
	ar p "${_deb}" data.tar.xz | bsdtar xf -
}

package() {
	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/share/man/"
	install -Dm644 "${srcdir}/usr/share/man/man1/"* "${pkgdir}/usr/share/man/"
}

