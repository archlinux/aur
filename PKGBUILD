# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=3.1
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v${pkgver}/sof-v${pkgver}-linux-amd64"
				"${url}/releases/download/v${pkgver}/sof.1.gz")
noextract=("sof.1.gz")
sha256sums=("756c0dfd4253a2b6077efaa030718675bdfb22d59fd3f6ee17324955f5822e2c"
						"998a1f4092f1dcf193e347554c3ce281ab7630fa49e825e344b0d8ebe4e663e9")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
