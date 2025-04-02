# Maintainer: oech3

pkgname=coreutils-uutils-symlink
pkgver=0.0.29
pkgrel=3
pkgdesc="(use at own risk) symlinks to replace coreutils with uutils"
arch=('x86_64')
license=('GPL3' 'MIT')
url="https://uutils.github.io/"

depends=(uutils-coreutils)
conflicts=(coreutils b3sum sha3sum coreutils-uutils)
provides=(coreutils b3sum)

package() {
	mkdir -p "$pkgdir"/usr/bin
	for f in $(uu-coreutils --list)
	do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
	done
	rm "$pkgdir"/usr/bin/{kill,more,uptime}
	#for f in find xargs #error in makepkg.
	#do ln -sf /usr/bin/uutils-"$f" "$pkgdir"/usr/bin/"$f"
	#done
}
