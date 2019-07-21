# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=4.0.0r1
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=(http://rsync.alpinelinux.org/alpine/v3.10/main/x86_64/qemu-aarch64-$_pkgver.apk
	http://rsync.alpinelinux.org/alpine/v3.10/main/x86_64/qemu-arm-$_pkgver.apk
	http://rsync.alpinelinux.org/alpine/v3.10/main/x86_64/qemu-armeb-$_pkgver.apk
	aarch64.binfmt arm.binfmt armeb.binfmt
)

package() {
	for arch in aarch64 arm armeb; do
		install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
		install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
	done
}

md5sums=('7183d884aa194d66ccf188ad1dc6dc6f'
	'8fbfb8d7d30ac05ecdb22650f14b103b'
	'331e32fdfd074c6ee70c16d8e1a3653e'
	'209e75696b9f8d9c5e548ebae4c7d820'
	'c4d349aea05c4c6232998af6d750d937'
'30a72492eb2ba68dfbe70368f2e8a22b')
