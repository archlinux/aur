# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=9
pkgdesc='Remove npm, yarn and pnpm using corepack'
source=(corepack.conf)
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('CC0 1.0')
provides=("npm" "yarn" "pnpm")
conflicts=("npm" "yarn" "pnpm")
depends=("nodejs")

package() {
	install -dm 755 $pkgdir/usr/bin
	mkdir -p $pkgdir/etc/makepkg.conf.d
	install -m 644 $srcdir/corepack.conf $pkgdir/etc/makepkg.conf.d/corepack.conf
	/bin/corepack enable --install-directory $pkgdir/usr/bin
	/bin/corepack enable --install-directory $pkgdir/usr/bin npm
}
sha256sums=('ccfb5a4617a19c7dd0069e536f21ea5dbcd3ccb9d38e6d331ddd4b6ee79f0891')
