# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=4.1.1r0
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=(http://rsync.alpinelinux.org/alpine/edge/main/x86_64/qemu-aarch64-$_pkgver.apk
	http://rsync.alpinelinux.org/alpine/edge/main/x86_64/qemu-arm-$_pkgver.apk
	http://rsync.alpinelinux.org/alpine/edge/main/x86_64/qemu-armeb-$_pkgver.apk
	aarch64.binfmt arm.binfmt armeb.binfmt
)

package() {
	for arch in aarch64 arm armeb; do
		install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
		install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
	done
}

md5sums=('50abdbe79759a9b566eaa3bf9ba20afd'
         '55895ec94cb4f83378d9452a6f26db38'
         'f6786b0a700bd1bdeca087acb2a0d4fd'
         '209e75696b9f8d9c5e548ebae4c7d820'
         'c4d349aea05c4c6232998af6d750d937'
         '30a72492eb2ba68dfbe70368f2e8a22b')
